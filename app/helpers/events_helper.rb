module EventsHelper
	def display_likes(event)
		votes = event.votes_for.up.by_type(User)
		return list_likers(votes) if votes.size <= 8 
		count_likers(votes)
	end

	def url_with_protocol(url)
    /^http/i.match(url) ? url : "http://#{url}"
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
