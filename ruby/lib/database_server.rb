require 'sinatra/base'

class DatabaseServer < Sinatra::Base
  post("/set") do
    halt(422, "Please set a valid key") unless params[:key]
    Key.create_or_update(params[:key])
  end

  get("/get") do
    halt(204, "No key has been set")
    Key.last.value
  end
  
end
