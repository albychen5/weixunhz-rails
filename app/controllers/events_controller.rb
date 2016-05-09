class EventsController < ApplicationController
	before_action :set_event, only: [:show, :edit, :update, :destroy]

	def index
		@events = Event.all
	end

	def show
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.create(event_params)
		if @event.save
			flash[:success] = "Event created!"
			redirect_to @event
		else
			flash.now[:alert] = "Event could not be created."
			render :new
		end
	end

	def edit
	end

	def update
		if @event.update(event_params)
			flash[:success] = "Event updated!"
			redirect_to @event
		else
			flash.now[:alert] = "Event could not be updated."
			render :edit
		end
	end

	def destroy
		if @event.destroy
			flash[:success] = "Event deleted!"
			redirect_to root_path
		else
			flash.now[:alert] = "Event could not be deleted"
		end
	end

	private
	def set_event
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:image, :name)
	end
end
