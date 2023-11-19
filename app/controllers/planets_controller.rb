class PlanetsController < ApplicationController
  #GET /api/planets
  def index
    @planets = Planet.all

    render json: @planets, status: :ok
  end

  #POST /api/planets
  def create
    @service = PlanetServices::Create.call(planet_params)

    render_service
  end

  #PUT /planets/id
  def update
    @service = PlanetServices::Update.call(params[:id],planet_params)

    render_service
  end

  #DELETE /planets/{id}
  def destroy
    @planet = Planet.find(params[:id])
    @planet.destroy
    
    render json: {"message":"planet deleted with success!"}
  end

  def search
    planets = Planet.all
    planets = planets.where('name LIKE ?', "%#{params[:search]}%") if params[:search]
    planets = planets.where('id = ?',params[:searchId].to_i) if params[:searchId]
    
    render json: planets.as_json, status: :ok
  end

  private

  def render_service
    if @service.success?
      render json: @service.result, status: :ok
    else
      render json: {  **@service.errors }, status: :unprocessable_entity
    end
  end

  def planet_params
    params.permit(
      :name, :weather, :ground, :search, :searchId
    )
  end
end
