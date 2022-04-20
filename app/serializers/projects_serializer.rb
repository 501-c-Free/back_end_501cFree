class ProjectsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :project_name, :description
  belongs_to :non_profit, serializer: NonProfitSerializer
  has_many :developers

end