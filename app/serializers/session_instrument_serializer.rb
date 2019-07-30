class SessionInstrumentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :session_id, :instrument_id, :session, :instrument, :user_sessions, :users
end
