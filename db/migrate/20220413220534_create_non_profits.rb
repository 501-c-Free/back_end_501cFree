class CreateNonProfits < ActiveRecord::Migration[5.2]
  def change
    create_table :non_profits do |t|
      t.string :non_profit_name
      t.string :city
      t.string :state
      t.string :representative_name
      t.string :representative_email
    end
  end
end
