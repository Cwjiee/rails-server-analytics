# frozen_string_literal: true

require_relative "lib/rails_server_analytics/version"

Gem::Specification.new do |spec|
  spec.name = "rails_server_analytics"
  spec.version = RailsServerAnalytics::VERSION
  spec.authors = ["Chong Wei Jie"]
  spec.email = ["jackchong398@gmail.com"]
  spec.homepage    = 'https://github.com/Cwjiee/rails-server-analytics'

  spec.summary = "A rails gem that shows your rails application metrics and analytics in a dashboard view"
  spec.description = <<~EOH
    A rails gem that shows your rails application metrics and analytics in a dashboard view.
    The gem applies a middleware to your rails application to trace requests and responses from your server, then pushes it to the database.
    Raw data stored will then be processed and show in an analytical view on your localhost.
  EOH
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Cwjiee/rails-server-analytics"
  spec.metadata["changelog_uri"] = "https://github.com/Cwjiee/rails-server-analytics/blob/main/CHANGELOG.md"

  spec.files = Dir["lib/**/*"]
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
