class Session < ApplicationRecord
    has_many :user_sessions
    has_many :users, through: :user_sessions
    has_many :session_instruments
    has_many :instruments, through: :session_instruments
end
