LAYOUT         = Pathname('app/views/layouts/application.html.erb')
LAYOUT_EXAMPLE = Pathname('app/views/layouts/application.example.html.erb')
HOME           = Pathname('app/views/pages/home.html.erb')
HOME_EXAMPLE   = Pathname('app/views/pages/home.example.html.erb')

def setup_basic_pages
  generate :controller, 'pages', 'home'
  route "root to: 'pages#home'"

  copy_file LAYOUT_EXAMPLE
  run "mv #{LAYOUT_EXAMPLE} #{LAYOUT}"

  copy_file HOME_EXAMPLE
  run "mv #{HOME_EXAMPLE} #{HOME}"
end