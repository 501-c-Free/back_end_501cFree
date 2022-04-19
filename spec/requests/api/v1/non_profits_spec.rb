require 'rails_helper'

RSpec.describe 'non profit requests' do 
    it 'will create a new non profit attached to a non profit user', :vcr do
        post "/api/v1/log_in", params: {email: 'test@yahoo.com', name: 'Johnny Appleseed'}
        post '/api/v1/create_representative', params: {user_id: User.first.id, type_of_user: 'representative'}
        post '/api/v1/non_profits', params: {current_user: User.first.id, ein: 530196605 }
        response_info = JSON.parse(response.body, symbolize_names: true)
        expect(response_info).to include(:mission, :charity_info_url, :tagline, :website_url, :charity_name, :ein, :state, :city, :zipcode, :street_address, :country, :category, :error)
    end
    it 'will return an error if the ein is bad', :vcr do 
        post "/api/v1/log_in", params: {email: 'test@yahoo.com', name: 'Johnny Appleseed'}
        post '/api/v1/create_representative', params: {user_id: User.first.id, type_of_user: 'representative'}
        post '/api/v1/non_profits', params: {current_user: User.first.id, ein: 0 }
        response_info = JSON.parse(response.body, symbolize_names: true)
        expect(response_info).to include(:error)
        expect(response_info[:error]).to eq('not found')
    end
    it 'will show a non profit that belongs to a user', :vcr do 
        post "/api/v1/log_in", params: {email: 'test@yahoo.com', name: 'Johnny Appleseed'}
        post '/api/v1/create_representative', params: {user_id: User.first.id, type_of_user: 'representative'}
        post '/api/v1/non_profits', params: {current_user: User.first.id, ein: 530196605 }
        get "/api/v1/non_profits/#{User.last.id}"
        response_info = JSON.parse(response.body, symbolize_names: true)
        expect(response_info[:ein]).to eq(530196605)
    end
end
