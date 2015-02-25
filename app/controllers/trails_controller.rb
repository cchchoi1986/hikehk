class TrailsController < ApplicationController
  def show
    @trail = Trail.find(params[:id])
    render 'show.json.jbuilder'
  end

  def index
    @trails = Trail.all
    render 'index.json.jbuilder'
  end

  def search

  end
end
