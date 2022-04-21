require 'rails_helper'

RSpec.describe 'developer requests' do 
    it 'will return a developer object' do 
        post "/api/v1/log_in", params: {email: 'test@yahoo.com', name: 'Johnny Appleseed'}
        post '/api/v1/create_developer', params: {user_id: User.first.id, type_of_user: 'developer'}
        get "/api/v1/developer/#{User.last.id}"
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
        get "/api/v1/developer/#{User.second.id}/projects"
        response_info = JSON.parse(response.body, symbolize_names: true)
        expect(response_info[:data].first[:attributes]).to include(:project_name, :description, :developers, :non_profit, :project_owner)
    end
    it 'will return all developers in the database' do 
        user_1 = User.create!(name: 'user 1', email: 'email1@email.com', type_of_user: 'developer')
        developer_1 = Developer.create!(name: user_1.name, email: user_1.email, user: user_1)
        user_1.developer_id = developer_1.id
        user_2 = User.create!(name: 'user 2', email: 'email2@email.com',type_of_user: 'developer')
        developer_2 = Developer.create!(name: user_2.name, email: user_2.email, user: user_2)
        user_2.developer_id = developer_2.id
        get '/api/v1/developer'
        response_info = JSON.parse(response.body, symbolize_names: true)
        expect(response_info[:data].length).to eq(2)
        expect(response_info[:type]) == 'developer'
        expect(response_info[:data].first[:attributes]).to include(:name, :email, :github, :linkedin)
    end
    it 'will update a developer' do 
        user_1 = User.create!(name: 'user 1', email: 'email1@email.com', type_of_user: 'developer')
        developer_1 = Developer.create!(name: user_1.name, email: user_1.email, user: user_1)
        user_1.developer_id = developer_1.id
        patch "/api/v1/developer/#{user_1.id}", params: {github: 'github.com', linkedin: 'linkedin.com/1'}
        expect(Developer.last.github).to eq('github.com')
        expect(Developer.last.linkedin).to eq('linkedin.com/1')
    end

end