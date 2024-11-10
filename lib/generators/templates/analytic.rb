# analytics_data = {
#   status: ok
#   headers: {
#
#   },
#   request_uri: "/posts",
#   request_method: "get",
#   path_info "/posts",
#   ip,
#   host: "127.0.0.1",
#   time: Time.now,
#   time_spent: Time.now
# }

class Analytic < ApplicationRecord
  def content
    self.analytics_data = JSON.parse(analytics_data)
  end

  def self.user
    Rails.root.to_path.split("/")[2]
  end

  def self.root
    Rails.root.to_path
  end

  def self.version
    ruby_version = `ruby -v`.split(" ")[1]
    rails_version = `rails -v`.split(" ")[1]

    {
      ruby_v: ruby_version,
      rails_v: rails_version
    }
  end
end
