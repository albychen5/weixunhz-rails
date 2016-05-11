require 'rails_helper'

feature 'display events on index' do
	scenario 'index displays job info' do
		user = create :user
		event_one = create(:event, name: "event one", user_id: user.id)
		event_two = create(:event, name: "event two", user_id: user.id)

		visit '/'
		expect(page).to have_content("event one")
		expect(page).to have_content("event two")
		expect(page).to have_css("img[src*='test']")
	end
end