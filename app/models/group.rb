class Group < ActiveRecord::Base
	# join table for describing user properties in groups
	has_many :group_relationships
	has_many :users, through: :group_relationships
	has_many :events
	has_many :proposals
end
