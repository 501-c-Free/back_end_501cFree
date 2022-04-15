require 'rails_helper'

RSpec.describe CharityNavigatorService do 
    describe 'search charities' do 
        it 'will return JSON of many different charities', :vcr do 
            charities = CharityNavigatorService.search_charities('Red')
            expect(charities).to be_a Array 
            expect(charities.first).to be_a Hash
            expect(charities.first).to include(:charityNavigatorURL, :mission, :charityName, :ein, :irsClassification)
            expect(charities.count).to be > 1 #many
        end
    end
    describe 'one charity' do 
        it 'will return one charity given an EIN', :vcr do 
            charity = CharityNavigatorService.one_charity(270823236)
            expect(charity).to be_a Hash
            expect(charity).to include(:charityNavigatorURL, :mission, :charityName, :ein, :irsClassification)
        end
    end
end