class SessionInstrumentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :session_id, :instrument_id, :session, :instrument, :user_sessions, :users
end
