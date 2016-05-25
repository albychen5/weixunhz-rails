class Event < ActiveRecord::Base
	acts_as_votable #voting gem

	has_many :participations
	has_many :users, through: :participations
	has_many :comments, dependent: :destroy
	has_many :notifications, dependent: :destroy

	validates_presence_of :user_id, :location, :details, :image
	validates :name, presence: true, length: { maximum: 300 }

	has_attached_file :image, styles: { :medium => "640x" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	accepts_nested_attributes_for :participations
end