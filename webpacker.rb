# frozen_string_literal: true

WEBPACKER_YML  = Pathname('config/webpacker.yml')
EXAMPLE_JS     = Pathname('config/webpack/environment-example.js')
ENVIRONMENT_JS = Pathname('config/webpack/environment.js')
CLIENT_DIR     = Pathname('client')
HELLO_REACT = Pathname('client/packs/hello_react.jsx')

def setup_webpacker
  rails_command 'webpacker:install:react'
  gsub_file WEBPACKER_YML, 'app/javascript', 'client'
  copy_file EXAMPLE_JS
  run "mv #{EXAMPLE_JS} #{ENVIRONMENT_JS}"
  directory CLIENT_DIR
  remove_file HELLO_REACT
end
