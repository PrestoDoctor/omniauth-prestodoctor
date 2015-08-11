require 'spec_helper'

describe OmniAuth::Strategies::PrestoDoctor do
  subject do
    OmniAuth::Strategies::PrestoDoctor.new({})
  end

  context 'client options' do
    it 'should have correct name' do
      expect(subject.options.name).to eq(:prestodoctor)
    end

    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('https://prestodoctor.com')
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('/oauth/authorize')
    end
  end
end
