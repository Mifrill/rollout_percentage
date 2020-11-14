# RolloutPercentage

The implementation of user-percentages feature but without required object
https://github.com/fetlife/rollout#user-percentages

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rollout_percentage'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rollout_percentage

## Usage

Manage percentage by rails console:

`feature_flag - @symbol`
`percentage_enabling - @integer`

    Rails.application.redis_client.set(feature_flag, percentage_enabling)
    Rails.application.redis_client.get(feature_flag)

### Rollout Client example

Simple implementation with [redis-rb](https://github.com/redis/redis-rb)

    require 'redis'
    
    class RolloutClient
      attr_accessor :redis
    
      def initialize(**args)
        self.redis = Redis.new(args)
      end
    
      def get(arg)
        redis.get(arg)
      end
    end

RolloutPercentage usage example:

    rollout_client = RolloutClient.new(url: url)

    RolloutPercentage.new(feature_flag: feature_flag, rollout_client: rollout_client).perform
      # => returns the boolean randomized by percentage

    RolloutPercentage.new(feature_flag: :feature_flag, rollout_client: rollout_client).perform do
      # => some block code here which should be run on randomized by percentage
    end

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `rake install`. To release a new version, update the version number (`RolloutPercentage::VERSION`) in `lib/rollout_percentage.rb`, and then run `rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Mifrill/rollout_percentage. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Mifrill/rollout_percentage/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RolloutPercentage project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Mifrill/rollout_percentage/blob/master/CODE_OF_CONDUCT.md).
