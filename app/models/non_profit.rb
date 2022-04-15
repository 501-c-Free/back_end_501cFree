class NonProfit < ApplicationRecord
    has_many :projects
    validates :representative_name, :representative_email, presence: true
end