class Group < ActiveRecord::Base
	# join table for describing user properties in groups
	has_many :group_relationships
	has_many :users, through: :group_relationships
	has_many :events, dependent: :destroy
	has_many :proposals, dependent: :destroy
end
