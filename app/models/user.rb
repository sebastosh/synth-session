class User < ApplicationRecord
    has_secure_password
    has_many :sessions
    has_many :instruments, through: :sessions
end
