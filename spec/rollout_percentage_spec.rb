describe RolloutPercentage do
  it 'has a version number' do
    expect(RolloutPercentage::VERSION).not_to be_nil
  end

  subject(:rollout_percentage) { described_class.new(feature_flag: feature_flag, rollout_client: rollout_client) }

  let(:rollout_client_klass) { Class.new { def get(*); end } }
  let(:rollout_client) { instance_double(rollout_client_klass) }
  let(:feature_flag) { :new_feature }
  let(:client_expectation) do
    -> { expect(rollout_client).to receive(:get).with(feature_flag).and_return(percentage_enabling) }
  end
  let(:target_block) { Class.new { def call(*); end } }

  context 'when disabled' do
    before { client_expectation.call }

    let(:percentage_enabling) { '0' }

    its(:perform) { is_expected.to eq(false) }

    context 'when flag does not exist' do
      let(:percentage_enabling) { nil }

      its(:perform) { is_expected.to eq(false) }
    end

    context 'when random number is 0' do
      before { expect(rollout_percentage).to receive(:random_number).and_return(0) }

      its(:perform) { is_expected.to eq(false) }
    end

    context 'when block passed' do
      it 'fires passed block' do
        expect(target_block).not_to receive(:call)
        rollout_percentage.perform do
          target_block.call
        end
      end
    end
  end

  context 'when enabled' do
    before { client_expectation.call }

    let(:percentage_enabling) { '100' }

    its(:perform) { is_expected.to eq(true) }

    context 'when block passed' do
      it 'fires passed block' do
        expect(target_block).to receive(:call).once
        rollout_percentage.perform do
          target_block.call
        end
      end
    end
  end
end
