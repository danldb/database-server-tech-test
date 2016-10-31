require 'spec_helper'
require 'database_server'
require 'rack/test'

RSpec.describe 'setting and getting keys' do
  include Rack::Test::Methods

  def app
    DatabaseServer
  end

  let(:params){ {some_key: "some string"} }

  after do
    #clean the data store between each test
    DataStore.instance.instance_variable_set(:@data, {})
  end

  context "setting a key" do
    it "accepts a post request" do
      post('/set', params)
      expect(last_response).to be_ok
    end

    it "returns 422 if no key param is present" do
      post('/set')
      expect(last_response.status).to eq(422)
      expect(last_response.body).to eq ErrorHelpers::MISSING_QUERY_PARAMS
    end

    it "returns 400 if key already exists" do
      post('/set', params)
      post('/set', params)
      expect(last_response.body).to eq ErrorHelpers::KEY_EXISTS
      expect(last_response.status).to eq(400)
    end
  end

  context "get the last key that was set" do

    it "returns 422 if there are no query params" do
      get('/get')
      expect(last_response.status).to eq(422)
    end

    it "returns the key" do
      post('/set', params)
      get('/get', params)
      expect(last_response).to be_ok
      expect(last_response.body).to eq(params[:some_key])
    end
  end
end
