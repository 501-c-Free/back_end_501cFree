class Representative < ApplicationRecord
    belongs_to :non_profit
    validates :name, :email, presence: true
end