class CartsController < ApplicationController

  def show
    cart = Cart.find_by(id: params[:id])
    render json: cart
  end

  def create
    cart = Cart.create(cart_params)
    render json: cart
  end

  def delete
    cart = Cart.find(params[:id])
    cart.destroy
    render json: cart
  end

  private

  def cart_params
    params.require(:cart).permit(:user_id, :cupcake_id)
  end
end
