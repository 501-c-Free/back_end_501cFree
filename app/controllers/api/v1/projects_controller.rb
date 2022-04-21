class Api::V1::ProjectsController < ApplicationController

    def index 
        # options = {include: [:non_profit]}
        render json: ProjectSerializer.new(Project.all)
    end
    def create 
        user_nonprofit = User.find(params[:user_id]).non_profit
        Project.create!(project_name: params[:project_name], description: params[:description], non_profit: user_nonprofit)
        render json: user_nonprofit.projects.last
    end
    
    def show 
        options = {include: [:non_profit, :developers]}
        render json: ProjectSerializer.new(Project.find(params[:id]))
    end
end