require 'rails_helper'

RSpec.describe Representative do 
    describe 'associations' do 
        it { should belong_to(:non_profit) }
    end
end