class User < ActiveRecord::Base
    has_secure_password
has_many :addresses
validates :username, :name, :password, presence: true

validates :username, uniqueness: true



end