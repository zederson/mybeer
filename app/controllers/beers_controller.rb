class BeersController < ApplicationController

  before_filter :require_authentication, :only => [:new, :edit, :create, :update, :destroy]


  def index
    @beers = Beer.order(:style, :name)
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def new
    @beer = Beer.new
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def destroy
    @beer = Beer.find(params[:id])
    @beer.destroy

    redirect_to(beers_url, :notice => "Cerveja excluida Com Sucesso")
  end

  def create
    @beer = Beer.new beer_params

    if(@beer.save)
      # redirect_to(beers_url, :notice => "Cerveja #{@beer.name} Criada Com Sucesso!!")
      redirect_to @beer, :notice => t('flash.notice.beer_created')
    else
      render :action =>"new"
    end
  end

  def update
    @beer = Beer.find(params[:id])

    if @beer.update_attributes(beer_params)
      # redirect_to(beers_url, :notice => "Cerveja #{@beer.name} Alterada Com Sucesso")
      redirect_to @beer, :notice => t('flash.notice.beer_updated')
    else
      render :action => "edit"
    end
  end

private
  def beer_params
    params.require(:beer).permit(:name, :style, :description, :brewery, :location, :color, :alcohol, :foam, :aroma)
  end

end
