class EventsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_event, only: [:show, :edit, :update, :destroy, :like]
	before_action :event_owner_verification, only: [:edit, :update, :destroy]

	def index
		@events = Event.all.order('created_at DESC').page params[:page]
	end

	def new
		@event = current_user.events.build
	end

	def create
		@event = current_user.events.build(event_params)
		if @event.save
			flash[:success] = "Event created!"
			redirect_to events_path
		else
			flash.now[:alert] = "Event could not be created."
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @event.update(event_params)
			flash[:success] = "Event updated!"
			redirect_to events_path
		else
			flash.now[:alert] = "Event could not be updated."
			render :edit
		end
	end

	def destroy
		@event.destroy
		flash[:success] = "Event deleted!"
		redirect_to root_path
	end

	def like
		if @event.liked_by current_user
			respond_to do |format|
				format.html { redirect_to :back }
				format.js
			end
		end
	end

	private
	
	def event_params
		params.require(:event).permit(:image, :name)
	end

	def set_event
		@event = Event.find(params[:id])
	end

	def event_owner_verification
		unless current_user.id == @event.user.id
			flash[:alert] = "Not allowed to edit event"
			redirect_to root_path
		end
	end
end
