class BirdsController < ApplicationController

  wrap_parameters format: []
  

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  def create
    # dynamic way
    render json: Bird.create(birds_params), status: :created
    # rigid way
    # render json: Bird.create(name: params[:name], species: params[:species]), status: :created
  end

  private
  def birds_params
    params.permit(:name, :species)
  end
end