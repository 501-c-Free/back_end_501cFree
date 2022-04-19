class Api::V1::ProjectsController < ApplicationController
    def create 
        user_nonprofit = User.find(params[:user_id]).non_profit
        Project.create!(project_name: params[:project_name], description: params[:description], non_profit: user_nonprofit)
        render json: user_nonprofit.projects.last
    end
end