require 'sinatra/base'
require_relative 'helpers/error_helpers'
require_relative 'data_store'

class DatabaseServer < Sinatra::Base
  include ErrorHelpers
  set :port, 4000

  data_store = DataStore.instance

  before do
    halt_with_422 if params.empty?
  end

  post("/set") do
    begin
      data_store.set(params.keys.first, params.values.first)
      return
    rescue DataStore::KeyExistsError
      halt_with_400
    end
  end

  get("/get") do
    data_store.get(params.keys.first)
  end
end

