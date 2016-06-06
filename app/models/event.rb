class Event < ActiveRecord::Base
	belongs_to :user
	has_many :attendees, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :notifications, dependent: :destroy

	validates :user_id, presence: true
	validates_presence_of :location, :details, :image
	validates :name, presence: true, length: { maximum: 300 }

	has_attached_file :image, styles: { :medium => "640x" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end