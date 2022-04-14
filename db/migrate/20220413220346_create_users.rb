class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      # make unique? 
      t.string :email
      t.integer :type_of_user
    end
  end
end
