class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "User"  # added listing 12.3, 12.5
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  
end
