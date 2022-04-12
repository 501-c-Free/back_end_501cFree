class AddProjectToProjectDevelopers < ActiveRecord::Migration[5.2]
  def change
    add_reference :project_developers, :project, foreign_key: true
  end
end
