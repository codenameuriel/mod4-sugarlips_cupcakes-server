class UsersController < ApplicationController

    def index
        users = User.all 
        render json: users
    end

    def show
        # byebug
        user = User.find_by(username: params[:username])
        if user 
            render json: user
        else
            render json: { message: 'No user found with that username' }
        end
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: @user 
        else
            render json: { message: 'No user found with that id' }
        end
    end

    def update 
        user=User.find(params[:id])
        if user 
            user.update(user_params)
            render json: { message: 'user succesfilly updates' }
        else
            render json: { message: 'unable to update user' }
        end
    end

    def update 
        user=User.find(params[:id])
        if user 
            user.destroy
            # render json: {message:'user succesfilly deleted'}
            render json: user
        end
    end

    private 

    def user_params
      params.require(:user).permit(:username, :password)
    end
end
