require 'rails_helper'

RSpec.describe CharityNavigatorFacade do 
    describe 'class methods', :vcr do 
        it 'will return a bunch of charities when searched' do 
            facade = CharityNavigatorFacade.search_charities('Red')
            expect(facade).to be_a Array 
            expect(facade.first).to be_a NGO
        end
        it 'will have the necessary attributes' do 
            facade = CharityNavigatorFacade.search_charities('Red')
            expect(facade.first.mission).to be nil
            expect(facade.first.charity_info_url).to eq("https://www.charitynavigator.org/?bay=search.profile&ein=270823236&utm_source=DataAPI&utm_content=6bc9f3c8")
            expect(facade.first.tagline).to be nil
            expect(facade.first.website_url).to be nil
            expect(facade.first.charity_name).to eq("Red Oak Chamber And Industry Association Inc")
            expect(facade.first.ein).to eq("270823236")
            expect(facade.first.state).to eq("IA")
            expect(facade.first.city).to eq("Red Oak")
            expect(facade.first.zipcode).to eq("51566-4300")
            expect(facade.first.street_adress).to eq("307 East Reed Street")
            expect(facade.first.country).to eq("USA")
            expect(facade.first.category).to eq("Promotion of Business")
        end
        it 'will return all the data for one charity given a EIN', :vcr do 
            facade = CharityNavigatorFacade.one_charity('270823236')
            expect(facade.mission).to be nil
            expect(facade.charity_info_url).to eq("https://www.charitynavigator.org/?bay=search.profile&ein=270823236&utm_source=DataAPI&utm_content=6bc9f3c8")
            expect(facade.tagline).to be nil
            expect(facade.website_url).to be nil
            expect(facade.charity_name).to eq("Red Oak Chamber And Industry Association Inc")
            expect(facade.ein).to eq("270823236")
            expect(facade.state).to eq("IA")
            expect(facade.city).to eq("Red Oak")
            expect(facade.zipcode).to eq("51566-4300")
            expect(facade.street_adress).to eq("307 East Reed Street")
            expect(facade.country).to eq("USA")
            expect(facade.category).to eq("Promotion of Business")
        end
    end
end