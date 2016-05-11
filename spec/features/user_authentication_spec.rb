require 'rails_helper'

feature 'User authentication' do
	background do
		user = create :user
	end

	scenario 'can login with navbar link' do
		visit '/'
		expect(page).to_not have_content('Create Event')

		click_link 'Login'
		fill_in 'Email', with: 'testrailsdev@weixunhz.com'
		fill_in 'Password', with: 'password'
		click_button 'Log in'

		expect(page).to have_content("Signed in successfully.")
		expect(page).to_not have_content("Register")
		expect(page).to have_content("Logout")
	end

	scenario 'can logout once logged in' do
		visit '/'
		click_link 'Login'
		fill_in 'Email', with: 'testrailsdev@weixunhz.com'
		fill_in 'Password', with: 'password'
		click_button 'Log in'

		click_link 'Logout'
		expect(page).to have_content("Signed out successfully.")
	end

	scenario 'cannot create new events without logging in' do
		visit new_event_path
		expect(page).to have_content("You need to sign in or sign up before continuing.")
	end
end 