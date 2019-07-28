class SessionInstrument < ApplicationRecord
  belongs_to :session
  belongs_to :instrument
  has_many :user_sessions, through: :session
  has_many :users, through: :user_sessions
end
