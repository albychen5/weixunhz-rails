class Event < ActiveRecord::Base
	belongs_to :user
	belongs_to :group
	has_many :attendees, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :notifications, dependent: :destroy

	validates :user_id, presence: true
	validates :group_id, presence: true
	validates :name, presence: true, length: { maximum: 300 }
	validates_presence_of :location, :details, :image

	has_attached_file :image, styles: { :medium => "640x" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end