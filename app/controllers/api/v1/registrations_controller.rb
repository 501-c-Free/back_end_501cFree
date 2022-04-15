class Api::V1::RegistrationsController < ApplicationController
    def create 
        user = User.create!(
            email: params[:email], 
            name: params[:name], 
            type_of_user: params[:type_of_user]
        )
        if user 
            session[:user_id] = user.id 
            render json: {
                status: :created, 
                user: user
            }
        else 
            render json: {status: 500}
        end
    end
end