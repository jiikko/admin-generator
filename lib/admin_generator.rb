require "admin_generator/version"
require 'rails/generators'

module AdminGenerator
  class AdminGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)

    def init
      gem "sorcery"

      directory "controllers", "app/controllers"
      directory "views", "app/views"

      generate "sorcery:install"
      generate "sorcery:install", "activity_logging brute_force_protection --only-submodules"

      route <<-EOH
namespace :admin do
    root 'home#index'
    resource :sessions, only: %i(create)
    get 'login' => 'sessions#new', as: :login
    get 'logout' => 'sessions#destroy', as: :logout
  end
      EOH
    end
  end
end
