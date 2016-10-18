require 'sinatra/base'

class DatabaseServer < Sinatra::Base
  post("/set") do
    unless params[:key]
      status(422)
    end
  end
  
end
