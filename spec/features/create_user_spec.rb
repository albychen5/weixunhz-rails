require 'rails_helper'

feature 'Creating new user' do
	background do
		visit '/'
		click_link 'Register'
	end

	scenario 'can create new user on index page' do 
		fill_in 'Username', with: "testrailsdev"
		fill_in 'Email', with: "testrailsdev@weixunhz.com"
		fill_in 'Password', with: "password", match: :first
		fill_in 'Password confirmation', with: "password"

		click_button 'Sign up'
		expect(page).to have_content("Welcome! You have signed up")
	end
end