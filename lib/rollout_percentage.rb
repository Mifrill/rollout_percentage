require 'rollout_percentage/version'

module RolloutPercentage
  class Error < StandardError; end

  class RolloutPercentage
    attr_accessor :feature_flag, :rollout_client

    def initialize(feature_flag, rollout_client: Rails.application.redis_client)
      self.feature_flag = feature_flag
      self.rollout_client = rollout_client
    end

    def perform
      if enabled?
        block_given? ? yield : true
      else
        false
      end
    end

    private

    def enabled?
      percentage = rollout_client.get(feature_flag)
      percentage && random_number < percentage.to_i
    end

    def random_number
      rand(100)
    end
  end
end
