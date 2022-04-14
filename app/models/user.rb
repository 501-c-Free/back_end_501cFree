class User < ApplicationRecord
    belongs_to :developer, optional: true
    belongs_to :non_profit, optional: true
    enum type_of_user: { developer: 0, representative: 1}
    validates_presence_of :type_of_user
    after_create :create_type

    def create_type
        if type_of_user == 'developer'
            developer = Developer.create!(name: name, email: email)
            self.developer_id = Developer.last.id
            self.save
        elsif type_of_user == 'representative' 
            NonProfit.create!(representative_name: name, representative_email: email)
            self.non_profit_id = NonProfit.last.id
            self.save
        end
    end
end