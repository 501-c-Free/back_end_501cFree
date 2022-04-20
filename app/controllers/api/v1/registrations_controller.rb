class Api::V1::RegistrationsController < ApplicationController
    def developer 
        user = User.find(params[:user_id])
        if user.type_of_user.nil?
            # initial creation
            Developer.create!(name: user.name, email: user.email)
            user.type_of_user= 'developer'
            user.developer_id = Developer.last.id
            user.save
        else 
            # adding githublinkedin
            developer = user.developer
            developer.github = params[:github]
            developer.linkedin = params[:linkedin]
            developer.save
        end
    end
    def representative 
        user = User.find(params[:user_id])
        NonProfit.create!(representative_name: user.name, representative_email: user.email)
        user.type_of_user= 'representative'
        user.non_profit_id = NonProfit.last.id
        user.save
    end
end