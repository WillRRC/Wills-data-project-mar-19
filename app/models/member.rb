class Member < ActiveRecord::Base
  paginates_per 3

  has_secure_password

  validates :username, :password, presence: true, length: {minimum: 3}
  validates :username, uniqueness:true

  has_many :posts
end
