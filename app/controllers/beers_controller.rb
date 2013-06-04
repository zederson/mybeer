class BeersController < ApplicationController

  before_filter :require_authentication, :only => [:new, :edit, :create, :update, :destroy]

  def index
    @beers = Beer.most_recent.order(:style, :name)
  end

  def show

    @beer = Beer.find(params[:id])
    if user_signed_in?
      @user_review = @beer.reviews.find_or_initialize_by_user_id(current_user.id)
    end
  end

  def new
    @beer = current_user.beers.build
  end

  def edit
    @beer = current_user.beers.find(params[:id])
  end

  def destroy
    @beer = current_user.beers.find(params[:id])
    @beer.destroy

    redirect_to(beers_url, :notice => t('flash.notice.destroy'))
  end

  def create
    @beer = current_user.beers.build beer_params

    if(@beer.save)
      redirect_to @beer, :notice => t('flash.notice.beer_created')
    else
      render :action =>"new"
    end
  end

  def update
    @beer = current_user.beers.find(params[:id])

    if @beer.update_attributes(beer_params)
      redirect_to @beer, :notice => t('flash.notice.updated')
    else
      render :action => "edit"
    end
  end

  private
    def beer_params
      params.require(:beer).permit(:name, :style, :description, :brewery, :location, :color, :alcohol, :foam, :aroma)
    end

end
