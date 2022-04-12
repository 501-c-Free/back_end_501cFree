class CreateNonProfits < ActiveRecord::Migration[5.2]
  def change
    create_table :non_profits do |t|
      t.string :name
      t.string :city
      t.string :state
      t.references :project, foreign_key: true, null: :true
    end
  end
end
