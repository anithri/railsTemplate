# frozen_string_literal: true

PACKAGES = %w[
  apollo-boost
  graphql
  react-apollo
  react-apollo-hooks

  @fortawesome/react-fontawesome
  @fortawesome/fontawesome-pro
  @fortawesome/pro-solid-svg-icons
  @fortawesome/pro-regular-svg-icons
  @fortawesome/pro-light-svg-icons

  classnames
  core-js
  graphql

  prettier
  react-helmet
  react-router-dom
  react-toastify
  tachyons-custom
  webpack-merge
].freeze

def add_yarn_packages
  run "yarn add -s #{PACKAGES.join(" ")}"
  run 'mv app/javascript client'

  run "yarn add -s 'git+ssh:gitlab:4Winds/atmosphere'"
end
