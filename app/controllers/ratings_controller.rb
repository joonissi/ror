class RatingsController < ApplicationController
  before_action :ensure_that_is_not_banned
  
  def index
    @ratings = Rating.all
    @ratings_count = Rating.all.count
    @ratings_last_five = Rating.recent
    @top_breweries = Brewery.top 2
    @top_beers = Beer.top 2
    #@top_styles = Style.top 2
    @top_raters = User.top 2
  end

  def new
    @rating = Rating.new
    @beers = Beer.all
  end

  def create
    @rating = Rating.new params.require(:rating).permit(:score, :beer_id)
    @rating.user = current_user

    if @rating.save
      redirect_to user_path current_user
    else
      @beers = Beer.all
      render :new
    end
  end

  def destroy
    rating = Rating.find(params[:id])
    rating.delete if current_user == rating.user
    redirect_to user_path(current_user)
  end
end
