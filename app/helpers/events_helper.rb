module EventsHelper
	def display_likes(event)
		votes = event.votes_for.up.by_type(User)
		return list_likers(votes) if votes.size <= 8 
		count_likers(votes)
	end

	def info_not_specified(event, property)
		if property == nil
			return 'TBD'
		else
			return property
		end
	end

	def current_user_is_attending(current_user_id, current_event_id)
		attending = Participation.find_by(event_id: current_event_id, user_id: current_user_id )
		return true if attending
	end

	private

	def list_likers(votes)
		usernames = []
		unless votes.blank?
			votes.voters.each do |voter|
				usernames.push(link_to voter.username,
												profile_path(voter.username),
												class: 'username')
			end
			usernames.to_sentence.html_safe + like_plural(votes)
		end
	end

	def count_likers(votes)
		vote_count = votes.size
		vote_count.to_s + ' likes'
	end

	def like_plural(votes)
		return ' like this' if votes.count > 1
		' likes this'
	end
end
