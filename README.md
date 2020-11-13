# RolloutPercentage

The implementation of user-percentages feature but without required object
https://github.com/fetlife/rollout#user-percentages

`feature_flag - @symbol`
`percentage_enabling - @integer`

Manage percentage by rails console:

    Rails.application.redis_client.set(feature_flag, percentage_enabling)

How to use:

    RolloutPercentage.new(feature_flag: feature_flag).perform
     returns the boolean randomized by percentage
    
    RolloutPercentage.new(feature_flag: :feature_flag).perform do
     some block code here which should be run on randomized by percentage
    end

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

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rollout_percentage. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/rollout_percentage/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RolloutPercentage project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rollout_percentage/blob/master/CODE_OF_CONDUCT.md).
