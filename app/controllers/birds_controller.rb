class BirdsController < ApplicationController
  def show
    @birds = Trail.find(params[:id]).region.birds
    render 'show.json.jbuilder'
  end
  def index
    @birds = Bird.all
    render 'index.json.jbuilder'
  end
end
