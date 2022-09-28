class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :api_key

  set_type "users"
end

#"8831899f5292b69c37a875eb571de9ab"
