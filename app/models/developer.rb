class Developer < ApplicationRecord 
    has_many :project_developers
    has_many :projects, through: :project_developers
end