class ProfilesController < ApplicationController

    def index
        profiles=Profile.all 
        render json:profiles

    end

    def show
        profile=Profile.find(params[:id])
        render json:profile
    end

    def create
        profile=Profile.new(profile_params)
        if profile.save
            render json:profile 
        else
            render {error:'error:unable to create profile'}
        end
    end

    def update 
        profile=Profile.find(params[:id])
        if profile 
            profile.update(profile_params)
            render json:{message:'profile succesfilly updates'}
        else
            render json:{error:'unable to update profile'}
        end
    end

    def delete 
        profile=Profile.find(params[:id])
        if profile 
            profile.destroy
            render json:{message:'profile succesfilly deleted'}
        else
            render json:{error:'unable to delete profile'}
        end
    end

    private 
    def profile_params
        params.require(:profile).permit(:user_id,:first_name,:last_name,:phone_number,:credit_card,:address_1,:adress_2,:city,:state,:zip_code)
    end
end
