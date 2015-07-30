class MapsController < ApplicationController

  def index

  end

  def search
    parameters = { term: params[:term], limit: 12 }
    render json: Yelp.client.search('Seattle', parameters)
  end

  private
  def client
  Yelp.client.configure do |config|
  config.consumer_key = ENV['YELP_API']
  config.consumer_secret = ENV['YELP_SECRET']
  config.token = ENV['YELP_TOKEN']
  config.token_secret = ENV['YELP_TOKEN_SECRET']
  end
  end

end

