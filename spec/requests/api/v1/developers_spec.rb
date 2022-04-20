require 'rails_helper'

RSpec.describe 'developer requests' do 
    it 'will return a developer object' do 
        post "/api/v1/log_in", params: {email: 'test@yahoo.com', name: 'Johnny Appleseed'}
        post '/api/v1/create_developer', params: {user_id: User.first.id, type_of_user: 'developer'}
        get "/api/v1/developer/#{Developer.last.id}"
        response_info = JSON.parse(response.body, symbolize_names: true)
        expect(response_info[:data]).to include(:id, :type, :attributes)
        expect(response_info[:data][:attributes]).to include(:name, :email, :github, :linkedin)
    end
    it 'will show projects that a developer has been assigned to', :vcr do 
        # create project with non profit 
        post "/api/v1/log_in", params: {email: 'rep@yahoo.com', name: 'Boss man'}
        post '/api/v1/create_representative', params: {user_id: User.first.id, type_of_user: 'representative'}
        post '/api/v1/non_profits', params: {current_user: User.first.id, ein: 530196605 }
        post '/api/v1/projects', params: {project_name: 'name', description: 'project description', user_id: User.first.id}
        delete "/api/v1/logout"
        # create developer 
        post "/api/v1/log_in", params: {email: 'developer@yahoo.com', name: 'Developer John'}
        post '/api/v1/create_developer', params: {user_id: User.last.id, type_of_user: 'developer'}
        ProjectDeveloper.create!(developer: Developer.first, project: Project.first)
        get "/api/v1/developer/#{Developer.first.id}/projects"
        response_info = JSON.parse(response.body, symbolize_names: true)
        expect(response_info[:data][:attributes][:projects].first).to include(:id, :project_name, :description, :non_profit_id)
    end

end