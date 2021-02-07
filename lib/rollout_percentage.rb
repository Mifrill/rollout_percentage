class RolloutPercentage
  VERSION = '0.1.2'.freeze

  def initialize(feature_flag:, rollout_client:)
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

  attr_accessor :feature_flag, :rollout_client

  def enabled?
    percentage = rollout_client.get(feature_flag)
    percentage && random_number < percentage.to_i
  end

  def random_number
    rand(100)
  end
end
