class Post < ApplicationRecord
  belongs_to :user
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  validates :title,
            :content,
            :user,
              presence: true
end
