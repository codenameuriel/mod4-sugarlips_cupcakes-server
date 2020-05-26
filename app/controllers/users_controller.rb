class UsersController < ApplicationController

    def index
        users = User.all 
        render json: users, include: [:cupcakes]
    end

    def show
        # byebug
        user = User.find_by(username: params[:username])
        if user 
            render json: user, include: [:cupcakes]
        else
            render json: { message: 'No user found with that username' }
        end
    end

    def create
        # byebug
        user = User.create(user_params)

        if user
            render json: user, include: [:cupcakes]
        else
            render {error:'error:unable to create user'}
        end
    end

    def update 
        user=User.find(params[:id])

        if user 
            user.update(user_params)
            render json: user, include: [:cupcakes]
        else
            render json:{error:'unable to update user'}
        end
    end

 

    private 

    def user_params
      params.require(:user).permit(:username, :password, :first_name, :last_name, :address_1, :address_2, :city, :state, :zip_code, :phone_number, :credit_card)
    end
end
