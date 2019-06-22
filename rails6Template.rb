# Rails 6, webpacker, postgres, react, atmosphere
# 2019-06-19

def add_gems
  gem 'aasm'
  gem 'graphql'
  gem 'interactor-rails', git: 'git@github.com:CPPWind/interactor-rails.git'
  gem 'active_hash'

  gem_group :development do
    gem 'better_errors'
    gem 'annotate'
    gem 'guard-bundler'
    gem 'guard-process'
    gem 'guard-rails'
    gem 'guard-spring'
    gem 'libnotify'
    gem 'aasm-diagram', require: false
    gem "foreman", "~> 0.64.0"
    gem "awesome_print", "~> 1.8"
  end
end

def add_js
  `yarn add apollo-client apollo-cache-inmemory apollo-link-http apollo-link-error apollo-link graphql-tag @babel/preset-react @fortawesome/fontawesome-pro-regular @fortawesome/fontawesome-pro-solid @fortawesome/fontawesome-svg-core @fortawesome/pro-light-svg-icons @fortawesome/pro-regular-svg-icons @fortawesome/pro-solid-svg-icons @fortawesome/react-fontawesome babel-plugin-transform-react-remove-prop-types babel-preset-react classnames core-js graphql honeycomb-grid hygen-add hygen-create inflection node-sass postcss-comment-2 postcss-import postcss-preset-env prettier prop-types react react-apollo react-apollo-hooks react-burger-menu react-helmet react-router-dom react-toastify tachyons-custom webpack-merge`
end

