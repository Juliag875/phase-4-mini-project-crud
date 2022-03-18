class SpicesController < ApplicationController
  def index
    render json: Spice.all
  end

  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  def update
    spice = find_spice
    if spice 
      spice.update(spice_params)
      render json: spice, status: :accepted
    else
      render json: {error: "Not found"}, status: :not_found
  end

  def destroy
    spice = find_spice
    spice.destroy
    head :no_content
  end
end

  private

  def find_spice
    Spice.find_by(id: params[:id])
  end


  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end
end
