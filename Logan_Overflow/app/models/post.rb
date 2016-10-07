class Post < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :votes, as: :voteable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title,
            :content,
            :user,
              presence: true

  def self.ordered_json
    order("created_at ASC").as_json(only: :title,
                                     include:
                                        {votes:
                                          {only: :status}
                                        }
                                    )

  end

  def convert_json
    self.jsonify
  end

  def jsonify
    as_json(include:
              {user:
                {only: :username},
               comments:
               {include:
                  {user:
                    {only: :username}
                  }
                },
               answers:
                {include:
                   {user:
                     {only: :username},
                    comments:
                    {include:
                       {user:
                         {only: :username}
                       }
                     },
                     votes:
                     {only: :status}
                   }
                },
                votes:
                {only: :status}
              }
            )
    end
end
