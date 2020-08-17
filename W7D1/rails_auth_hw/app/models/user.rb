class User < ApplicationRecord
    validates :username, presence: true
    validates :password_digest, presence: true
    validates :password, length: {minimum: 6, allow_nil: true}

    
end
