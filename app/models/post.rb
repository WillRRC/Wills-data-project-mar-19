class Post < ActiveRecord::Base
  validates :post_title, presence: true, length: { minimum: 3}
  validates :post_body, presence: true, length: { minimum: 10}

end
