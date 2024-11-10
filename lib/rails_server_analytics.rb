# frozen_string_literal: true

require_relative "rails_server_analytics/version"
require "rails_server_analytics/analytics_tracer"
require "rails_server_analytics/engine" if defined?(Rails::Engine)

module RailsServerAnalytics
  class Error < StandardError; end
end
