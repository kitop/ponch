require 'rails/generators'
require "rails/generators/migration"

module Ponch
  module Generators

    class DeliveriesGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      desc "Creates a base migration for Ponch::Delivery model"

      source_root File.expand_path('../templates', __FILE__)

      def copy_files
        migration_template('create_deliveries.rb', 'db/migrate/create_ponch_deliveries.rb')
      end

      def self.next_migration_number(dirname) #:nodoc:
        if ActiveRecord::Base.timestamped_migrations
          Time.now.utc.strftime("%Y%m%d%H%M%S")
        else
          "%.3d" % (current_migration_number(dirname) + 1)
        end
      end

    end

  end
end
