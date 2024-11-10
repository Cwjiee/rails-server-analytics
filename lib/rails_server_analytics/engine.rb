require "rails/engine"

module RailsServerAnalytics
  class Engine < Rails::Engine
    initializer "server_analytics.configure_middleware" do |app|
      app.middleware.use RailsServerAnalytics::AnalyticsTracer
    end

    generators do
      require "generators/analytics_generator"
    end
  end
end
