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
    duration = params[:duration].to_i
    distance = params[:distance].to_i
    scenery = params[:scenery].to_i
    difficulty = params[:difficulty].to_i
    hk = params[:hk]
    kln = params[:kln]
    nt = params[:nt]
    regions = []


    if nt == "true"
      regions.push((1..9).to_a)
    end
    if kln == "true"
      regions.push((10..14).to_a)
    end
    if hk == "true"
      regions.push((15..18).to_a)
    end
    regions.flatten!

    query = Trail.where(duration: 0..duration)
                .where(distance: 0..distance)
                .where(difficulty: 0..difficulty)
                .where(scenery: 0..scenery)
                .where(region_id: regions)
    @query = query.order("name")

    render 'search.json.jbuilder'
  end

end
