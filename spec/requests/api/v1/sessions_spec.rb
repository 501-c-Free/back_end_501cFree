require 'rails_helper'

RSpec.describe 'sessions' do 
    it 'will create a new user' do 
        expect(User.count).to eq(0)
        post "/api/v1/log_in", params: {email: 'test@yahoo.com', name: 'Johnny Appleseed'}
        response_info = JSON.parse(response.body, symbolize_names: true)
        expect(User.count).to eq(1)
        expect(response_info[:status]).to eq('user_created')
        expect(response_info[:user]).to include(:name, :email, :type_of_user)
    end
    describe 'creating a developer' do 
        it 'will create a developer attached to user if developer is specified' do 
            post "/api/v1/log_in", params: {email: 'test@yahoo.com', name: 'Johnny Appleseed'}
            post '/api/v1/create_developer', params: {user_id: User.first.id, type_of_user: 'developer'}
            expect(Developer.count).to eq(1)
            expect(NonProfit.count).to eq(0)
        end
        it 'will pass the name and email attributes to the developer object' do 
            post "/api/v1/log_in", params: {email: 'test@yahoo.com', name: 'Johnny Appleseed'}
            post '/api/v1/create_developer', params: {user_id: User.first.id, type_of_user: 'developer'}
            expect(Developer.first.name).to eq('Johnny Appleseed')
            expect(Developer.first.email).to eq('test@yahoo.com')
        end
    end
    describe 'creating a nonprofit' do 
        it 'will create a nonprofit attached to user' do 
            post "/api/v1/log_in", params: {email: 'test@yahoo.com', name: 'Johnny Appleseed'}
            post '/api/v1/create_representative', params: {user_id: User.first.id, type_of_user: 'representative'}
            expect(Developer.count).to eq(0)
            expect(NonProfit.count).to eq(1)
        end
        it 'will pass the name and email attributes to the non profit object' do 
            post "/api/v1/log_in", params: {email: 'representative@yahoo.com', name: 'HR Person'}
            post '/api/v1/create_representative', params: {user_id: User.first.id, type_of_user: 'representative'}
            expect(NonProfit.first.representative_name).to eq('HR Person')
            expect(NonProfit.first.representative_email).to eq('representative@yahoo.com')
        end
    end
    describe 'log in and log out' do 
        before :each do 
            post "/api/v1/log_in", params: {email: 'representative@yahoo.com', name: 'HR Person'}
            delete "/api/v1/logout"
        end
        it 'will log in a user' do 
            post "/api/v1/log_in", params: {email: 'representative@yahoo.com', name: 'HR Person'}
            expect(controller.current_user).to eq(User.first)
        end
        it 'will log out a user' do 
            post "/api/v1/log_in", params: {email: 'representative@yahoo.com'}
            delete "/api/v1/logout"
            expect(controller.current_user).to eq(nil)
        end
    end
end