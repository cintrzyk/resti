module Resti
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def generate_paypal_sdk_install
        generate 'paypal:sdk:install'
      end

    end
  end
end
