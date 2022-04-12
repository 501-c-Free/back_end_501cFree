class NonProfit < ApplicationRecord
    # is this finalized? 
    has_one :project 
    has_many :project_developers, through: :project
    has_one :representative
end