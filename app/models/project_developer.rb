class ProjectDeveloper < ApplicationRecord
    belongs_to :developer 
    belongs_to :project
end