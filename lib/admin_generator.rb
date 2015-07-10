require "admin_generator/version"
require 'rails/generators'

class AdminGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def init
    gem "sorcery"

    directory "controllers", "app/controllers"
    directory "views", "app/views"

    generate "sorcery:install"
    generate "sorcery:install", "activity_logging brute_force_protection --migrations"

    route "namespace :admin do\n    root 'home#index'\n  end"
  end
end
