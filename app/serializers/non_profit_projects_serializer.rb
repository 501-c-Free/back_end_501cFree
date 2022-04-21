class NonProfitProjectsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :non_profit do |object|
    {
      non_profit_name: object.non_profit_name,
      street_address: object.street_address,
      city: object.city,
      state: object.state,
      representative_name: object.representative_name,
      representative_email: object.representative_email,
      category: object.category,
      ein: object.ein,
      mission: object.mission,
      website_url: object.website_url,
      tagline: object.tagline,
      zipcode: object.zipcode,
      charity_info_url: object.charity_info_url,
      country: object.country,
      calendly: object.calendly
    }
  end
  attributes :projects do |object|
    object.projects.each do |project|
      {
        project_name: project.project_name,
        project_description: project.description,
        project_id: project.id
      }
    end
  end
  attributes :user_owner do |object| 
    {user: object.user.id}
  end
end
