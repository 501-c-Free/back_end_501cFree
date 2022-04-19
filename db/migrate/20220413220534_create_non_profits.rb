class CreateNonProfits < ActiveRecord::Migration[5.2]
  def change
    create_table :non_profits do |t|
      t.string :non_profit_name
      t.string :city
      t.string :state
      t.string :representative_name
      t.string :representative_email
      t.string :category
      t.integer :ein 
      t.string :mission 
      t.string :street_address
      t.string :website_url
      t.string :tagline 
      t.string :zipcode 
      t.string :charity_info_url
      t.string :country
    end
  end
end
