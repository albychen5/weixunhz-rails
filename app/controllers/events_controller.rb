class EventsController < ApplicationController
	def index
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.create(event_params)
		redirect_to event_path
	end

	private
	def event_params
		params.require(:event).permit(:image, :name)
	end
end
