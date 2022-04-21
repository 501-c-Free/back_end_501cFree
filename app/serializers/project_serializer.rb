class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :project_name, :description
  attributes :developers do |object| 
    object.developers.each do |developer|
      {
        name: developer.name, 
        id: developer.id
      }
    end
  end
  attributes :non_profit do |object| 
    {
      charity_name: object.non_profit.non_profit_name,
      charity_id: object.non_profit.id
    }
  end
end