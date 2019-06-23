def setup_guard
  copy_file 'config/Guardfile', 'config/Guardfile'
  run 'ln -s config/Guardfile Guardfile'
  copy_file 'Procfile'
end
