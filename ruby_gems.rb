def add_ruby_gems
  gem 'aasm'
  gem 'graphql'
  gem 'interactor', '~> 3.0'
  gsub_file 'config/application.rb', 'Bundler.require', "require 'interactor'\nBundler.require"

  gem 'active_hash'
  gem 'graphql'

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

  run "mv Gemfile config"
  run "ln -s config/Gemfile Gemfile"
  after_bundle do
    generate 'graphql:install'

    gsub_file 'app/controllers/graphql_controller.rb',
              '< ApplicationController',
              "< ApplicationController\n  skip_before_action :verify_authenticity_token, raise: false\n"

  end
end
