class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :sessions, :instruments
end
