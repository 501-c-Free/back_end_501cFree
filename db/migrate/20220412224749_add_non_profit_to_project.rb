class AddNonProfitToProject < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :non_profit, foreign_key: true
  end
end
