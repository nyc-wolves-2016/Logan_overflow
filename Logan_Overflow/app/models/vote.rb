class Vote < ApplicationRecord
  belongs_to :voter, class_name: "User", foreign_key: "user_id"
  belongs_to :voteable, polymorphic: true

  validates :user_id,
              presence: true
end
