class CreateProjectDevelopers < ActiveRecord::Migration[5.2]
  def change
    create_table :project_developers do |t|
      t.references :developer, foreign_key: true
    end
  end
end
