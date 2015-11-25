class User < ActiveRecord::Base
   validates :login, presence: true, length: { maximum: 50 }   
   validates :password, length: { minimum: 6 }
   has_secure_password
end
