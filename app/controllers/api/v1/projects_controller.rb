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
        render json: ProjectSerializer.new(Project.find(params[:id]))
    end

    def update 
        developer = Developer.find(params[:developer_id])
        project = Project.find(params[:id])
        project.project_name = params[:name]
        project.description = params[:description]
        project.description = params[:description]
        project.save
        ProjectDeveloper.create!(project: project, developer: developer)
        render json: {status: :updated}
    end
end