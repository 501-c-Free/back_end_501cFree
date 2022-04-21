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
        project = Project.find(params[:id])
        project.project_name = params[:name]
        project.description = params[:description]
        project.save
        if params[:developer_id] != ""
            developer = Developer.find(params[:developer_id])
            if project.developers.include?(developer) == false 
                ProjectDeveloper.create!(project: project, developer: developer)
            end
        end
        render json: {status: :updated}
    end
end