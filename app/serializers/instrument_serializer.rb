class InstrumentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :instrument_type, :settings, :session_instruments, :sessions, :user_sessions, :users
end
