require 'spec_helper'
require 'database_server'
require 'rack/test'

RSpec.describe 'setting and getting keys' do
  include Rack::Test::Methods

  def app
    DatabaseServer
  end

  it "accepts a post request" do
    params = {key: "some string"}
    post('/set', params)
    expect(last_response).to be_ok
  end

  it "returns 422 if no key param is present" do
    post('/set')
    expect(last_response.status).to eq(422)
  end

  xit "returns an error if no key is set" do

  end

end
