ENV['RACK_ENV'] = 'test'

require './hipchat_notifier'
require 'rspec'
require 'rack/test'

describe 'Hipchat Notifier' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe '#GET /' do
    it 'responds with success' do
      get '/'
      expect(last_response).to be_ok
    end
  end

  describe '#POST /balanced' do
    it 'sends a hipchat message' do
      HipchatService.any_instance.should_receive(:send_message).and_return(true)
      file = File.read('sample_request.json')
      post '/balanced', file

      expect(last_response).to be_ok
    end
  end
end

describe HipchatMessage do
  def valid_attributes
    {uri:'/',
     type:'debit.succeeded',
     amount:1000}
  end

  describe "#initialize" do
    it 'creates an instance of Message' do
      test_message = HipchatMessage.new valid_attributes

      expect(test_message).to be_instance_of HipchatMessage
    end
    it 'sets #uri' do
      test_message = HipchatMessage.new valid_attributes
      expect(test_message.uri).to_not be_nil
    end
    it 'sets #amount' do
      test_message = HipchatMessage.new valid_attributes

      expect(test_message.amount).to_not be_nil
    end
    it 'sets #type' do
      test_message = HipchatMessage.new valid_attributes

      expect(test_message.type).to_not be_nil
    end
  end

  describe "#new_from_request" do
    it 'creates a new instance of message' do
      test_request = File.read('sample_request.json')
      test_message = HipchatMessage.new_from_request test_request

      expect(test_message).to be_instance_of(HipchatMessage)
    end
    it 'creates a valid instance of message' do
      test_request = File.read('sample_request.json')
      test_message = HipchatMessage.new_from_request test_request

      expect(test_message).to be_valid
    end
  end
end
