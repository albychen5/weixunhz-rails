class Participation < ActiveRecord::Base
	belongs_to :user
	belongs_to :event

	accepts_nested_attributes_for :user
end