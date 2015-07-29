class MapsController < ApplicationController

  def index

  end

  def search
    parameters = { term: params[:term], limit: 12 }
    render json: Yelp.client.search('Seattle', parameters)
  end

end