class User < ApplicationRecord
    has_secure_password # method from bcrypt gem
    has_many :records
end
