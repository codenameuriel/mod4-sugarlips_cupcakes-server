class CupcakesController < ApplicationController

  def index
    cupcakes = Cupcake.all
    render json: cupcakes
  end

  def show
    cupcake = Cupcake.find(params[:id])
    render json: cupcake
  end
end
