require 'rails_helper'

RSpec.describe 'registrations' do 
    it 'will create a new user' do 
        expect(User.count).to eq(0)
        post "/api/v1/registrations", params: {email: 'test@yahoo.com', name: 'Johnny Appleseed', type_of_user: 'developer'}
        response_info = JSON.parse(response.body, symbolize_names: true)
        expect(User.count).to eq(1)
        expect(response_info[:status]).to eq('created')
        expect(response_info[:user]).to include(:name, :email, :type_of_user)
    end
    describe 'creating a developer' do 
        it 'will create a developer attached to user if developer is specified' do 
            post "/api/v1/registrations", params: {email: 'test@yahoo.com', name: 'Johnny Appleseed', type_of_user: 'developer'}
            response_info = JSON.parse(response.body, symbolize_names: true)
            expect(response_info[:user][:developer_id]).to eq(Developer.last.id)
            expect(Developer.count).to eq(1)
            expect(NonProfit.count).to eq(0)
        end
        it 'will pass the name and email attributes to the developer object' do 
            post "/api/v1/registrations", params: {email: 'test@yahoo.com', name: 'Johnny Appleseed', type_of_user: 'developer'}
            expect(Developer.first.name).to eq('Johnny Appleseed')
            expect(Developer.first.email).to eq('test@yahoo.com')
        end
    end
    describe 'creating a nonprofit' do 
        it 'will create a nonprofit attached to user if representative is specified' do 
            post "/api/v1/registrations", params: {email: 'representative@yahoo.com', name: 'HR Person', type_of_user: 'representative'}
            response_info = JSON.parse(response.body, symbolize_names: true)
            expect(response_info[:user][:non_profit_id]).to eq(NonProfit.last.id)
            expect(Developer.count).to eq(0)
            expect(NonProfit.count).to eq(1)
        end
        it 'will pass the name and email attributes to the developer object' do 
            post "/api/v1/registrations", params: {email: 'representative@yahoo.com', name: 'HR Person', type_of_user: 'representative'}
            expect(NonProfit.first.representative_name).to eq('HR Person')
            expect(NonProfit.first.representative_email).to eq('representative@yahoo.com')
        end
    end
end