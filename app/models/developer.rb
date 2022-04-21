class Developer < ApplicationRecord 
    has_many :project_developers
    has_many :projects, through: :project_developers
    has_one :user
    validates :name, :email, presence: true
end