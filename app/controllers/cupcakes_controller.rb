class CupcakesController < ApplicationController

  def index
    cupcakes = Cupcake.all
    render json: cupcakes
  end

  def show
    cupcake = Cupcake.find(params[:id])
    render json: cupcake
  end
  def create
    cupcake=Cupcake.new(cupcake_params)
    if cupcake.save
        render json:cupcake 
    else
        render error:{'error:unable to create cupcake'},status:400
    end
  end

  def update 
    cupcake=Cupcake.find(params[:id])
    if cupcake 
        cupcake.update(cupcake_params)
        render json:{message:'cupcake succesfully updates'}, status 200
    else
        render json:{error:'unable to update cupcake'}, status:400
    end
end

def delete 
    cupcake=Cupcake.find(params[:id])
    if cupcake 
        cupcake.destroy
        render json:{message:'cupcake succesfilly deleted'}, status 200
    else
        render json:{error:'unable to delete cupcake'}, status:400
    end
end

  private 
  def cupcake_params
      params.require(:cupcake).permit(:name,:flavor,:price,:image)
  end
end
