class SessionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :user, :instrument
end
