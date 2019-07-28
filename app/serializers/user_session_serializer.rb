class UserSessionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :session_id, :user, :session, :session_instruments, :instruments
end
