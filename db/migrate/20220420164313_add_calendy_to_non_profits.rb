class AddCalendyToNonProfits < ActiveRecord::Migration[5.2]
  def change
    add_column :non_profits, :calendly, :string
  end
end
