class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :sessions
end
