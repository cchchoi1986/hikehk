class PlantsController < ApplicationController
  def show
    @plants = Trail.find(params[:id]).region.plants
    render 'show.json.jbuilder'
  end
  def index
    @plants = Plant.all
    render 'index.json.jbuilder'
  end
end
