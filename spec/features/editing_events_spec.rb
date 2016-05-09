require 'rails_helper'

feature 'editing events' do
	background do
		job = create(:event)

		visit '/'
		find(:xpath, "//a[contains(@href, 'events/1')]").click
		click_link 'Edit'
	end

	scenario 'can edit post' do
		fill_in 'Name', with: "Updated with edit"
		click_button 'Update Event'

		expect(page).to have_content("Event updated!")
		expect(page).to have_content("Updated with edit")
	end

	scenario 'edit without image' do
		attach_file('Image', 'spec/files/noimage.zip')
		click_button 'Update Event'

		expect(page).to have_content("Event could not be updated.")
	end
end