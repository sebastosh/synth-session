class InstrumentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :settings, :session_instruments, :sessions, :user_sessions, :users
end
