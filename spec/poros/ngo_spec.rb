# require 'rails_helper'
# require '../../app/poros/ngo' 
# RSpec.describe 'NGO' do 
#   it 'will create an NGO object' do
#     data = {
#                 mission: 'Do good!', 
#                 charityNavigatorURL: 'www.charitynavigator.com/1234', 
#                 tagLine: 'Make the world a better place', 
#                 websiteURL: 'dogooders.com', 
#                 charityName: 'Do Gooders', 
#                 ein: "4320124", 
#                 mailingAddress: {
#                     stateOrProvince: 'CA',
#                     city: 'los angeles', 
#                     postalCode: '90035-1000', 
#                     streetAddress1: "1045 Wilshire Boulevard", 
#                     country: nil
#                 },
#                 irsClassification: {
#                     nteeClassification: 'Humanitarian'
#                 }
#             }
#     ngo = NGO.new(data)
#     expect(ngo).to be_a NGO
#     expect(ngo.mission).to eq('Do good!')
#     expect(ngo.charity_info_url).to eq('www.charitynavigator.com/1234')
#     expect(ngo.tagline).to eq('Make the world a better place')
#     expect(ngo.website_url).to eq('dogooders.com')
#     expect(ngo.charity_name).to eq('Do Gooders')
#     expect(ngo.ein).to eq("4320124")
#     expect(ngo.state).to eq("CA")
#     expect(ngo.city).to eq("Los Angeles")
#     expect(ngo.zipcode).to eq("90035-1000")
#     expect(ngo.street_adress).to eq("1045 Wilshire Boulevard")
#     expect(ngo.country).to eq("USA")
#     expect(ngo.category).to eq("Humanitarian")
#   end
# end