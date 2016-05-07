class EventsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@events = Event.all
	end

	def show
	end

	def new
		@event = Event.new
	end

	def create
		if @event = Event.create(event_params)
			flash[:success] = "Event created!"
			redirect_to events_path
		else
			flash[:alert] = "Event could not be created."
			render :new
		end
	end

	def edit
	end

	def update
		if @event.update(event_params)
			flash[:success] = "Event updated!"
			redirect_to events_path
		else
			flash[:alert] = "Event could not be updated."
			render :edit
		end
	end

	def destroy
		@event.destroy
		redirect_to root_path
	end

	private
	def set_post
		@event = Event.find(params[:id])
	end

	def event_params
		params.require(:event).permit(:image, :name)
	end
end
