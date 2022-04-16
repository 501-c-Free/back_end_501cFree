class User < ApplicationRecord
    belongs_to :developer, optional: true
    belongs_to :non_profit, optional: true
    enum type_of_user: { developer: 0, representative: 1}
    #validates_presence_of :type_of_user
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    
end
