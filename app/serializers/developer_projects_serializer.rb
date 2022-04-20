class DeveloperProjectsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :projects do |object| 
    object.projects.each do |project| 
      {
        name: project.project_name,
        description: project.description, 
        non_profit_id: project.non_profit_id, 
      }
    end
  end
end
