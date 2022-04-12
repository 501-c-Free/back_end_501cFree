require 'rails_helper'

RSpec.describe ProjectDeveloper do 
    describe 'associations' do 
        it { should belong_to(:developer) }
        it { should belong_to(:project) }
    end
end