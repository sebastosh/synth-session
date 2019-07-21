class SessionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :user, :user_id, :instrument_id, :instrument
end
