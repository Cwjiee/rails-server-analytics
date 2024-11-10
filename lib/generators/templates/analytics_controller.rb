class AnalyticsController < ApplicationController
  before_action :get_analytics, :process_raw_analytics

  def index
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @analytics_json }
    end
  end

  private

  def get_analytics
    @analytics = Analytic.all
    @analytics.each(&:content)
  end

  def process_raw_analytics
    request_count = @analytics.count
    total_request_per_day = @analytics.where(updated_at: (Time.now - 1.day)..Time.now).pluck(:updated_at).count

    average_response_time = get_average("time_spent")
    average_cpu_usage = get_average("cpu_usage")

    most_frequent_request = get_most_frequent("request_uri")
    most_frequent_request_method = get_most_frequent("request_method")

    version = Analytic.version
    user = Analytic.user
    root = Analytic.root

    @analytics_json = {
      analytics: @analytics,
      request_count: request_count,
      total_request_per_day: total_request_per_day,
      average_response_time: average_response_time,
      most_frequent_request: most_frequent_request,
      most_frequent_request_method: most_frequent_request_method,
      average_cpu_usage: average_cpu_usage,
      ruby_v: version[:ruby_v],
      rails_v: version[:rails_v],
      user: user,
      root: root
    }
  end

  def get_most_frequent(data)
    all_request = @analytics.map(&:analytics_data).pluck(data)
    all_request.detect { |r| all_request.count(r) > 1 }

    counts = all_request.group_by { |e| e }.transform_values(&:size)
    counts.max_by { |_, count| count }[0]
  end

  def get_average(data)
    all_data = @analytics.map(&:analytics_data).pluck(data)
    (all_data.sum / @analytics.count).truncate(3)
  end
end
