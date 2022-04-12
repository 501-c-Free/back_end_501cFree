class Project < ApplicationRecord
    has_many :project_developers
    has_many :developers, through: :project_developers
    belongs_to :non_profit
    
end