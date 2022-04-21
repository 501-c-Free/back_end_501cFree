class NonProfit < ApplicationRecord
    has_many :projects
    has_one :user
    validates :representative_name, :representative_email, presence: true
end