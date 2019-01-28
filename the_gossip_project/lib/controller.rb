require 'gossip'
require 'csv'

class ApplicationController < Sinatra::Base
    get '/' do
      erb :index, locals: {gossips: Gossip.all}
    end

    get '/gossips/:id/' do
      gossip_selected = Gossip.find(params[:id])
      erb :gossip_with_index, locals: {gossips: gossip_selected}
    end

    get '/gossips/new/' do
      erb :new_gossip
    end

    post '/gossips/new/' do
      Gossip.new(params["gossip_author"], params["gossip_content"]).save
      redirect '/'
    end
end