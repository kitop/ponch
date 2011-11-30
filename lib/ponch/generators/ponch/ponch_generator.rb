require 'rails/generators'
require "rails/generators/active_record"

module Ponch
  module Generators

    class PonchGenerator < Rails::Generators::NamedBase
      include Rails::Generators::Migration

      def manifest
        record do |m|
          m.migration_template('create_deliveries.rb', 'db/migrate', :migration_file_name => 'create_ponch_deliveries')
        end
      end

    end

  end
end
