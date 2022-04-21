require 'rails_helper'

RSpec.describe 'project developers requests' do 
    it 'can add a developer to a project' do 
        user_1 = User.create!(name: 'rep', email: 'rep@rep.com')
        non_profit = NonProfit.create!(non_profit_name: 'rep', representative_email: 'rep@rep.com', representative_name: 'rep')
        user_1.non_profit_id = non_profit.id
        project_1 = Project.create!(project_name: 'my first project', description: 'project 1 description', non_profit: non_profit)
        user_2 = User.create!(name: 'dev', email: 'dev@dev.com')
        developer = Developer.create!(name: 'dev', email: 'dev@dev.com')
        user_2.developer_id = developer.id
        post '/api/v1/project_developers', params: {project_id: project_1.id, developer_id: developer.id}
        expect(Project.first.developers.count).to eq(1)
        expect(Project.first.developers.first).to eq(developer)
    end
end