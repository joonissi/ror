class PlacesController < ApplicationController
  def index
  end

  def show
    #@place = params[:id]
    @place = Rails.cache.fetch(session[:last_search]).find_all { |favor| favor.id == params[:id] }[0]
  end

  def search
    @places = BeermappingApi.places_in(params[:city])
    @weather = WeatherApi.weather_in(params[:city])
    #@city = params[:city]
    
    if @places.empty?
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      session[:last_search] = params[:city]
      render :index
    end
  end
end
