# RailsServerAnalytics

This gem traces server requests and responses and stores the traced logs into the database. Users are able to view the server analytics by going to the `/analytics` view.

## Installation

Install the gem and add to the application's Gemfile by executing:

```
bundle add server_monitor
```

## Usage

```
rails generate analytics:install
```

```
rails db:migrate
```

Go to analytics view by accessing `/analytics` endpoint in the url. Exp:
```
localhost:3000/analytics

# or

127.0.0.1:3000/analytics
```
## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ServerMonitor project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Cwjiee/event_monitor/blob/main/CODE_OF_CONDUCT.md).

