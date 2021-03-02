class User < ApplicationRecord
  has_many :lessons
  has_many :relationships
  has_many :activities
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }

  has_secure_password
  validates :password, length: { minimum: 6 }, allow_nil: true

  def follow(other_user)
    Relationship.create(
      follower_id: id,
      followed_id: other_user.id
    )
  end

  def relationship(other_user)
    Relationship.find_by(
      follower_id: id,
      followed_id: other_user.id
    )
  end

  def active_relationships
    Relationship.where(follower_id: id)   #get all Relationship where current user is FOLLOWER
  end

  def following
    ids = active_relationships.pluck(:followed_id)      #get all FOLLOWER ID
    User.where(id: ids)                                 #get all FOLLOWER USERS where ID id in ID LIST
  end

  def passive_relationships
    Relationship.where(followed_id: id)
  end

  def followers
    ids = passive_relationships.pluck(:follower_id)
    User.where(id: ids)
  end

  def feed
    ids = following.pluck(:id)                             #get all ID of FOLLOWED USERS
    ids << id                                         #add current user ID to ID list

    Activity.where(user_id: ids)
  end

end