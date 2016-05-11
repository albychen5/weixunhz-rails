require 'rails_helper'

feature 'editing events' do
	background do
		# log into test account
		user = create :user
		user2 = create(:user, email: 'user2@weixunhz.com', username: 'user2', id: user.id + 1)
		event = create(:event, name: "test original event", user_id: user.id)
		event2 = create(:event, name: "test second event", user_id: user2.id)
		
		sign_in_with user

		visit '/'
	end

	scenario 'can edit event if owner' do
		find(:xpath, "//a[contains(@href, 'events/1')]").click
		expect(page).to have_content('Edit event')

		click_link 'Edit event'
		fill_in 'Name', with: "Updated with edit"
		click_button 'Update Event'

		expect(page).to have_content("Event updated!")
		expect(page).to have_content("Updated with edit")
	end

	scenario 'cannot edit event if not owner through link' do
		find(:xpath, "//a[contains(@href, 'events/2')]").click

		expect(page).to_not have_content("Edit event")
	end

	scenario 'cannot edit event if not owner through URL' do
		visit '/events/2/edit'
		expect(page.current_path).to eq root_path
		expect(page).to have_content("Not allowed to edit event")
	end

	scenario 'cannot edit without image' do
		find(:xpath, "//a[contains(@href, 'events/1')]").click
		click_link 'Edit event'
		fill_in 'Name', with: "Updated with edit"
		attach_file('Image', 'spec/files/noimage.zip')
		click_button 'Update Event'

		expect(page).to have_content("Event could not be updated.")
	end
end