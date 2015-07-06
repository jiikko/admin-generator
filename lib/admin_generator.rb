require "admin_generator/version"

module AdminGenerator
  class UserGenerator < Rails::Generators::Base
    def create_initializer_file
      `rails g sorcery:install`
    end
  end
end
