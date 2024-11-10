require "active_support/log_subscriber"

module RailsServerAnalytics
  class AnalyticsTracer < ActiveSupport::LogSubscriber

    def initialize(app)
      @app = app
    end

    def call(env)
      Rails.logger.info(color("Processing request in middleware", YELLOW)) 

      time_start = Time.now
      before_cpu = `ps -o %cpu= -p #{Process.pid}`.strip.to_f

      status, headers, response = @app.call(env)
      # request = ActionDispatch::Request.new env

      # data = {status:, headers:, response: response.body, request: request.body, time:}
      request_uri = env["REQUEST_URI"]
      request_method = env["REQUEST_METHOD"].downcase
      path_info = env["PATH_INFO"]
      ip = env["action_dispatch.remote_ip"].calculate_ip
      host = env["HTTP_HOST"]
      time_end = Time.now

      time_spent = time_end - time_start

      after_cpu = `ps -o %cpu= -p #{Process.pid}`.strip.to_f
      cpu_usage = after_cpu - before_cpu

      return [status, headers, response] if path_info.eql? "/analytics"

      analytics_data = JSON.pretty_generate({
        status:,
        headers:,
        request_uri:,
        request_method:,
        path_info:,
        ip:,
        host:,
        time_spent:,
        cpu_usage:,
      })

      analytics = Analytic.create(analytics_data:)

      Rails.logger.info(color("response data stored", GREEN)) 
      # write_data(data)

      [status, headers, response]
    end

    def write_data(data)
      json_path =
        if defined?(Rails)
          analytics_dir = File.join(Rails.root, "analytics_data/")
          FileUtils.mkdir_p(analytics_dir)[0] + "trace.json"
        end

      File.open(json_path, "w") do |f|
        f.write(JSON.pretty_generate(data))
      end
    end
  end
end

