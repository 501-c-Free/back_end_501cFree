require 'rails_helper'

RSpec.describe NonProfit do 
    describe 'assocations' do 
        it { should have_many(:projects) }
    end
    describe 'validations' do 
        it { should validate_presence_of(:representative_email) }
        it { should validate_presence_of(:representative_name) }
        # Do we want this?
        # it { should validate_presence_of(:city) }
        # it { should validate_presence_of(:state) }
        # it { should validate_presence_of(:non_profit_name) }
    end
end