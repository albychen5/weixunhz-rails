class ParticipationsController < ApplicationController
	before_action :set_event
	def index
		@participations = Participation.all
	end

	def new
		@user = current_user
		@participation = Participation.new
	end

	def create
		Participation.create(participation_params)
		redirect_to event_path(@event)
	end

	def attend_event
		if current_user.attend @event.id
			respond_to do |format|
  			format.html { redirect_to root_path }
  			format.js
  		end
  	end
	end

	def unattend_event
		if current_user.unattend @event.id
			respond_to do |format|
  			format.html { redirect_to root_path }
  			format.js
  		end
  	end
	end

	private
	def participation_params
		params.require(:participation).permit(:id, :user_id, :event_id, :attendee_name, :attendee_email)
	end

	def set_event
		@event = Event.find(params[:event_id])
	end
end
