RSpec.describe SlackHook::Incoming do
  let(:payload) { {"text": "rspec"} }

  subject { described_class.new("https://hooks.slack.com/services/TC30EGPDJ/BL2BH3J8H/I4Ho2M2kCjrG8sRwNHHthVT") }

  describe '#post' do
    it 'should post to slack successfully' do
      VCR.use_cassette('success_hook') do
        expect(subject.post(payload).code).to eq('200')
      end
    end

    it 'should post to slack with fail' do
      VCR.use_cassette('fail_hook') do
        expect(subject.post({}).code).to eq('400')
      end
    end
  end
end
