class Instrument < ApplicationRecord
    has_many :session_instruments
    has_many :sessions, through: :session_instruments
    has_many :user_sessions, through: :sessions
    has_many :users, through: :user_sessions
end
