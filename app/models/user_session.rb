class UserSession < ApplicationRecord
  belongs_to :user
  belongs_to :session
  has_many :session_instruments, through: :session
  has_many :instruments, through: :session_instruments

end
