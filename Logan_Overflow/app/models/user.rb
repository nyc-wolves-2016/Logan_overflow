class User < ApplicationRecord
  has_many :posts
  has_many :answers
  has_many :votes
  has_many :comments
  has_many :answered_posts, through: :answers, source: :post
  has_many :post_votes, through: :posts, source: :votes
  has_many :answer_votes, through: :answers, source: :votes

  validates :username,
            :email,
              presence: true
              
  validates :username, uniqueness: { scope: :email }

  has_secure_password
end
