require 'sinatra/base'

class DatabaseServer < Sinatra::Base
  post("/set") do
    unless params[:key]
      halt(422, "Please set a valid key")
    end
  end

  get("/get") do
    halt(204, "No key has been set")
  end

  
end
