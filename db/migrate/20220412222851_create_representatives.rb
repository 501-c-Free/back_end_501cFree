class CreateRepresentatives < ActiveRecord::Migration[5.2]
  def change
    create_table :representatives do |t|
      t.string :name
      t.string :email
      t.references :non_profit, foreign_key: true
    end
  end
end
