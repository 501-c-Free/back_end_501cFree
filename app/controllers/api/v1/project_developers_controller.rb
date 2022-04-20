class Api::V1::ProjectDevelopersController < ApplicationController
    def create 
        ProjectDeveloper.create!(project: Project.find(params[:project_id]), developer: Developer.find(params[:developer_id]))
    end
end