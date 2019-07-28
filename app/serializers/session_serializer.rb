class SessionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :user_sessions, :users, :session_instruments, :instruments
  
end
