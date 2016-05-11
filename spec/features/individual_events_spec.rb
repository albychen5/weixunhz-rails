require 'rails_helper'

feature 'Can view individual posts' do
	background do
		user = create :user
		event = create(:event, name: "test view post", user_id: user.id)

		sign_in_with user
	end

	scenario 'click to view post' do
		find(:xpath, "//a[contains(@href,'events/1')]").click
    expect(page.current_path).to eq(event_path(1))
	end
end