require 'rails_helper'

RSpec.describe Developer do 
    describe 'associations' do 
        it { should have_many(:project_developers) }
        it { should have_many(:projects).through(:project_developers) }
    end
    describe 'validations' do 
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:email) }
    end
end