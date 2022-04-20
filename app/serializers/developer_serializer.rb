class DeveloperSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :github, :linkedin
end
