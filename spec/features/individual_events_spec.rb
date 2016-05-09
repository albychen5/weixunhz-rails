require 'spec_helper'

feature 'Can view individual posts' do
	scenario 'click to view post' do
		event = create(:event)

		visit '/'
		find(:xpath, "//a[contains(@href,'events/1')]").click
    expect(page.current_path).to eq(event_path(event))
	end
end