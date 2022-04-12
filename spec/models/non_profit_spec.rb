require 'rails_helper'

RSpec.describe NonProfit do 
    describe 'assocations' do 
        it { should have_many(:project_developers).through(:project) }
        it { should have_one(:project) }
        it { should have_one(:representative) }
    end
end