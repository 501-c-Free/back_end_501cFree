class CreateDevelopers < ActiveRecord::Migration[5.2]
  def change
    create_table :developers do |t|
      t.string :name
      t.string :email
      t.string :github
      t.string :linkedin
    end
  end
end
