require 'sinatra/base'
require 'helpers/error_helpers'
require 'models/key'

class DatabaseServer < Sinatra::Base
  include ErrorHelpers
  set :port, 4000

  post("/set") do
    halt_with_422 unless params[:key]
    Key.create_or_update(params[:key])
    return
  end

  get("/get") do
    key = Key.last
    halt(204) unless key
    return key.to_s
  end
end

