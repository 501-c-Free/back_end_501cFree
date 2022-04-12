require 'rails_helper'

RSpec.describe Representative do 
    describe 'associations' do 
        it { should belong_to(:non_profit) }
    end
    describe 'validations' do 
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:email) }
    end
end