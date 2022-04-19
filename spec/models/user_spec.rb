require 'rails_helper'

RSpec.describe User do 
    describe 'associations' do 
        it { should belong_to(:developer).optional }
        it { should belong_to(:non_profit).optional }
    end
    describe 'validations' do 
    end
    describe 'instance methods' do 
    end
end