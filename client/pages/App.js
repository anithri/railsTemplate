import "stylesheets/app.css";
import Pages from "pages";
import React from "react";
import { Helmet as ReactHelmet } from "react-helmet";
import setupIcons from "stylesheets/fontawesome";
import { ApolloProvider as ApolloHooksProvider } from "react-apollo-hooks";
import { ToastContainer } from "react-toastify";

import { ApolloClient } from "apollo-client";
import { InMemoryCache } from "apollo-cache-inmemory";
import { HttpLink } from "apollo-link-http";
import { onError } from "apollo-link-error";
import { withClientState } from "apollo-link-state";
import { ApolloLink, Observable } from "apollo-link";

setupIcons();

const client = new ApolloClient({
  fetchOptions: {
    credentials: "same-origin"
  },
  request: async operation => {
    const csrfToken = document
      .querySelector("meta[name=csrf-token]")
      .getAttribute("content");

    operation.setContext({
      headers: { "X-CSRF-Token": csrfToken }
    });
  },
  uri: "http://localhost:3000/graphql",
  connectToDevTools: true
});

const cache = new InMemoryCache({});

const request = async operation => {
  const token = await AsyncStorage.getItem("token");
  operation.setContext({
    headers: {
      authorization: token
    }
  });
};

const requestLink = new ApolloLink(
  (operation, forward) =>
    new Observable(observer => {
      let handle;
      Promise.resolve(operation)
        .then(oper => request(oper))
        .then(() => {
          handle = forward(operation).subscribe({
            next: observer.next.bind(observer),
            error: observer.error.bind(observer),
            complete: observer.complete.bind(observer)
          });
        })
        .catch(observer.error.bind(observer));

      return () => {
        if (handle) handle.unsubscribe();
      };
    })
);

const client = new ApolloClient({
  link: ApolloLink.from([
    onError(({ graphQLErrors, networkError }) => {
      if (graphQLErrors) {
        sendToLoggingService(graphQLErrors);
      }
      if (networkError) {
        logoutUser();
      }
    }),
    requestLink,
    withClientState({
      defaults: {
        isConnected: true
      },
      resolvers: {
        Mutation: {
          updateNetworkStatus: (_, { isConnected }, { cache }) => {
            cache.writeData({ data: { isConnected } });
            return null;
          }
        }
      },
      cache
    }),
    new HttpLink({
      uri: "https://w5xlvm3vzz.lp.gql.zone/graphql",
      credentials: "include"
    })
  ]),
  cache
});
class App extends React.Component {
  render() {
    return (
      <ApolloProvider client={client}>
        <ApolloHooksProvider client={client}>
          <ToastContainer />
          <Pages className="max">
            <ReactHelmet>
              <meta charSet="utf-8" />
              <title>Cultage</title>
            </ReactHelmet>
          </Pages>
        </ApolloHooksProvider>
      </ApolloProvider>
    );
  }
}

export default App;
