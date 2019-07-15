class SessionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :modules, :user_id
end
