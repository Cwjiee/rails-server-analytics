# frozen_string_literal: true

require_relative "lib/rails_server_analytics/version"

Gem::Specification.new do |spec|
  spec.name = "rails_server_analytics"
  spec.version = RailsServerAnalytics::VERSION
  spec.authors = ["Chong Wei Jie"]
  spec.email = ["jackchong398@gmail.com"]
  spec.homepage    = 'https://github.com/Cwjiee/rails-server-analytics'

  spec.summary = "A middleware to trace and montior requests and responses in rails"
  spec.description = "a gem that applies a custom middleware in a rails application for tracing requests and generates an analytics page for monitoring."
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Cwjiee/rails-server-analytics"
  spec.metadata["changelog_uri"] = "https://github.com/Cwjiee/rails-server-analytics/CHANGELOG.md"

  spec.files = Dir["lib/**/*"]
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
