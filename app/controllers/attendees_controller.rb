class AttendeesController < ApplicationController
	before_action :set_event
	before_action :set_attendee, only: [:edit, :update]
	def index
		@attendees = @event.attendees.all.order("created_at ASC")
	end

	# def show
	# end

	def new
		@attendee = Attendee.new
	end

	def create
		@attendee = Attendee.new(attendee_params)
		@attendee.event_id = @event.id
		if @attendee.save
			flash[:success] = "Attendee Created"
			redirect_to event_attendees_path(@event)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @attendee.update(attendee_params)
			flash[:success] = "Attendee Updated"
			redirect_to event_attendees_path(@event)
		else
			render 'edit'
		end
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

	def set_attendee
		@attendee = Attendee.find(params[:id])
	end

end
