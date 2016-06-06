class AttendeesController < ApplicationController
	before_action :set_event, only: [:index, :show, :edit, :update, :destroy]
	def index
		@attendees = @event.attendees.all.order("created_at ASC")
	end

	# def show
	# end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def attendee_params
		params.require(:attendee).permit(:name, :phone_number)
	end

	def set_event
		@event = Event.find(params[:event_id])
	end

end
