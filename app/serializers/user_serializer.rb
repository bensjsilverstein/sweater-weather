class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :api_key

  set_type "users"
end
