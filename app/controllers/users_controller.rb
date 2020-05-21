class UsersController < ApplicationController


    def index
        @users=User.all 
        render json:@users

    end

    def show
        @user=User.find(params[:id])
        render json:@user
    end

    def create
        @user=User.new(user_params)
        if @user.save
            render json:@user 
        else
            render error:{'error:unable to create user'},status:400
        end
    end

    def update 
        @user=User.find(params[:id])
        if @user 
            @user.update(user_params)
            render json:{message:'user succesfilly updates'}, status 200
        else
            render json:{error:'unable to update user'}, status:400
        end
    end

    def update 
        @user=User.find(params[:id])
        if @user 
            @user.destroy
            render json:{message:'user succesfilly deleted'}, status 200
        else
            render json:{error:'unable to delete user'}, status:400
        end
    end

    private 
    def user_params
        params.require(:user).permit(:username,password)
    end

end
