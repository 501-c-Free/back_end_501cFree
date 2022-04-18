class Api::V1::RegistrationsController < ApplicationController
    def developer 
        user = User.find(params[:user_id])
        Developer.create!(name: user.name, email: user.email)
        user.type_of_user= 'developer'
        user.developer_id = Developer.last.id
        user.save
    end
end