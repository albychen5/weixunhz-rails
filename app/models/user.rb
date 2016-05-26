class User < ActiveRecord::Base
	acts_as_voter #voting gem

  has_many :participations
  has_many :events, through: :participations
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	validates :username, presence: true, length: { minimum: 3, maximum: 16 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_attached_file :avatar, styles: { medium: '152x152#' }  
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def events_feed
    following_ids = "SELECT following_id FROM follows
                     WHERE  follower_id = :user_id"
    Event.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end

  # follow and unfollow other user methods
  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  # def attend(event_id)
  #   participations.create(event_id: event_id)
  # end

  # def unattend(event_id)
  #   participations.find_by(event_id: event_id).destroy
  # end
end
