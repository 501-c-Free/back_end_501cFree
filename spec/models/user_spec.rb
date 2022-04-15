require 'rails_helper'

RSpec.describe User do 
    describe 'associations' do 
        it { should belong_to(:developer).optional }
        it { should belong_to(:non_profit).optional }
    end
    describe 'validations' do 
        it { should validate_presence_of(:type_of_user) }
    end
    describe 'instance methods' do 
        it 'will create a developer if type = 0' do 
            expect(Developer.all.count).to eq(0)
            user = User.create!(name: 'name', email: 'email@yahoo.com', type_of_user: 0)
            expect(Developer.all.count).to eq(1)
        end
        it 'will create a nonprofit if type = 1' do 
            expect(NonProfit.all.count).to eq(0)
            user = User.create!(name: 'name', email: 'email@yahoo.com', type_of_user: 1)
            expect(NonProfit.all.count).to eq(1)
        end
    end
end