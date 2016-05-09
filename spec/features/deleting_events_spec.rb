require 'rails_helper'

feature 'deleting events' do
	background do
		job = create(:event, name: "test delete post")

		visit '/'
		find(:xpath, "//a[contains(@href, 'events/1')]").click
		click_link 'Edit event'
	end
	
	scenario 'can delete single event' do
		click_link 'Delete event'

		expect(page).to_not have_content("test delete post")
		expect(page).to have_content("Event deleted!")
	end
end