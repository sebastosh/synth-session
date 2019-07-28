class User < ApplicationRecord
    has_secure_password
    has_many :user_sessions
    has_many :sessions, through: :user_sessions
    has_many :session_instruments, through: :sessions
    has_many :instruments, through: :session_instruments
    has_many :messages
end
