require "rails/generators/base"

module Analytics
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)
      desc "analyctics controller installation generator"

      def create_analytics_controller
        template "analytics_controller.rb", "app/controllers/analytics_controller.rb"
      end

      def create_analytics_view
        template "index.html.erb.tt", "app/views/analytics/index.html.erb"
      end

      def add_analytics_route
        route "get 'analytics', to: 'analytics#index'"
      end

      def create_model_file
        template "analytic.rb", "app/models/analytic.rb"
      end

      def create_migration_file
        timestamp = Time.now.utc.strftime("%Y%m%d%H%M%S")
        template "migration.rb", "db/migrate/#{timestamp}_create_analytics.rb"
      end
    end
  end
end
