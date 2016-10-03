class Vote < ApplicationRecord
  belongs_to :voter, foreign_key: :user_id
  belongs_to :voteable

  validates :voter, presence: true
end
