require 'spec_helper'
require 'database_server'
require 'rack/test'

RSpec.describe 'setting and getting keys' do
  include Rack::Test::Methods

  def app
    DatabaseServer
  end

  let(:params){ {key: "some string"} }

  after do
    clean_singleton
  end

  context "setting a key" do
    it "accepts a post request" do
      post('/set', params)
      expect(last_response).to be_ok
    end

    it "returns 422 if no key param is present" do
      post('/set')
      expect(last_response.status).to eq(422)
      expect(last_response.body).to eq ErrorHelpers::KEY_NOT_FOUND
    end
  end

  context "get the last key that was set" do

    it "returns 204 if there is no key set" do
      get('/get')
      expect(last_response.status).to eq(204)
    end

    it "returns the key" do
      post('/set', params)
      get('/get')
      expect(last_response).to be_ok
      expect(last_response.body).to eq(params[:key])
    end
  end

  def clean_singleton
    #messy but necessary until we build persistance
    Key.send(:all=, [])
  end
end
