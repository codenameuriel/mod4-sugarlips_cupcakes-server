class CartsController < ApplicationController

  def show
    cart = Cart.find_by(id: params[:id])
    render json: cart, include: [:cupcake]
  end

  def create
    # byebug
    cart = Cart.create(cart_params)
    render json: cart, include: [:cupcake]
  end

  def remove 
    # byebug
    cart = Cart.find do |cart| 
      cart.user.id == params[:user] && cart.cupcake.id == params[:cupcake]
    end.destroy

    render json: cart.user.cupcakes
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
