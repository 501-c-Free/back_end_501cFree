class AddTypesOfUsersToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :developer, foreign_key: true
    add_reference :users, :non_profit, foreign_key: true
  end
end
