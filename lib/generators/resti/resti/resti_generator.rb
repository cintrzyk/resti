require 'rails/generators/active_record'

module Resti
  module Generators
    class RestiGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def change_or_create_resti_model
        return change_resti_on_model if (invoke_behavior? && model_exists?) || (revoke_behaviour? && migration_exists?("add_resti_to_#{table_name}"))
        create_resti_model if invoke_behavior? || migration_exists?("resti_create_#{table_name}")
      end

      private

      def change_resti_on_model
        create_change_resti_model_migration
      end

      def create_resti_model
        create_resti_model_migration
        invoke 'active_record:model', [name], migration: false #if invoke_behavior?
      end

      def create_resti_model_migration
        migration_template 'create_model_table.rb', "db/migrate/resti_create_#{table_name}.rb"
      end

      def create_change_resti_model_migration
        migration_template 'add_to_model_table.rb', "db/migrate/add_resti_to_#{table_name}.rb"
      end

      def migration_exists?(name)
        Dir.glob("#{migration_path}/[0-9]*_*.rb").grep(/\d+_#{name}.rb$/).present?
      end

      def migration_path
        @migration_path ||= File.join(destination_root, 'db/migrate')
      end

      def model_exists?
        @model_exists ||= File.exists? model_path
      end

      def model_path
        @model_path ||= File.join(destination_root, 'app/models', class_path, "#{file_name}.rb")
      end

      def invoke_behavior?
        behavior == :invoke
      end

      def revoke_behaviour?
        behavior == :revoke
      end
    end
  end
end
