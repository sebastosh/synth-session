class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :user_sessions, :sessions, :session_instruments, :instruments
  
end
