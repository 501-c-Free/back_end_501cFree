require 'rails_helper'

RSpec.describe 'Projects requests' do 
    before :each do 
        user_1 = User.create!(name: 'rep', email: 'rep@rep.com')
        non_profit = NonProfit.create!(non_profit_name: 'rep', representative_email: 'rep@rep.com', representative_name: 'rep')
        user_1.non_profit_id = non_profit.id
        @project_1 = Project.create!(project_name: 'my first project', description: 'project 1 description', non_profit: non_profit)
        user_2 = User.create!(name: 'rep2', email: 'rep2@rep.com')
        non_profit_2 = NonProfit.create!(non_profit_name: 'rep2', representative_name: 'rep2', representative_email: 'rep2@rep.com')
        user_2.non_profit_id = non_profit_2.id
        project_2 = Project.create!(project_name: 'my first project', description: 'project 1 description', non_profit: non_profit_2)
    end
    it 'will show all projects in the database' do 
        get '/api/v1/projects'
        response_info = JSON.parse(response.body, symbolize_names: true)
        expect(response_info[:data].length).to eq(2)
        expect(response_info[:data].first).to include(:id, :type, :attributes)
        expect(response_info[:data].first[:attributes]).to include(:project_name, :description)
    end
    it 'will show all the developers attached to a project' do 
        user_3 = User.create!(name: 'user 1', email: 'email1@email.com', type_of_user: 'developer')
        developer_1 = Developer.create!(name: user_3.name, email: user_3.email)
        user_3.developer_id = developer_1.id
        ProjectDeveloper.create(developer: developer_1, project: @project_1)
        user_4 = User.create!(name: 'user 2', email: 'email2@email.com',type_of_user: 'developer')
        developer_2 = Developer.create!(name: user_4.name, email: user_4.email)
        user_4.developer_id = developer_2.id
        ProjectDeveloper.create(developer: developer_2, project: @project_1)
        get "/api/v1/projects/#{@project_1.id}"
        response_info = JSON.parse(response.body, symbolize_names: true)
        expect(response_info[:included].first[:attributes][:name]).to eq('user 1')
        expect(response_info[:included].second[:attributes][:name]).to eq('user 2')
        expect(response_info[:included].third[:attributes][:non_profit_name]).to eq('rep')
    
    end
end