class DeveloperSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :github, :linkedin
  attributes :user do |object| 
    {user_id: object.user.id}
  end
end