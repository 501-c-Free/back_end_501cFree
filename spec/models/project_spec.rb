require 'rails_helper'

RSpec.describe Project do 
    describe 'associations' do 
        it { should have_many(:project_developers) }
        it { should have_many(:developers).through(:project_developers) }
        it { should belong_to(:non_profit) }
    end
    describe 'validations' do 
        it { should validate_presence_of(:description) }
        it { should validate_presence_of(:project_name) }
    end
end