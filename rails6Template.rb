# Rails 6, webpacker, postgres, react, atmosphere
# 2019-06-19

require 'pathname'
require_relative './yarn_packages'
require_relative './ruby_gems'
require_relative './guard'
require_relative './webpacker'
require_relative './basic_pages'

TEMPLATE_DIR = Pathname(__dir__).expand_path

def source_paths
  [TEMPLATE_DIR]
end

after_bundle do
  add_ruby_gems
  add_yarn_packages

  setup_guard
  setup_webpacker
  setup_basic_pages
end