class Proposal < ActiveRecord::Base
	acts_as_votable #voting gem
  belongs_to :user
end
