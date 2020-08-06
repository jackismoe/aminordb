class User < ActiveRecord::Base
    validates               :username, 
                            :password, 
                            presence: true
    validates_uniqueness_of :username
    has_many                :songs
    has_secure_password
end
