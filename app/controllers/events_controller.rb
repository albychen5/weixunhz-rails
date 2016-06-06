class EventsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_event, only: [:show, :edit, :update, :destroy, :like, :unlike]
	before_action :event_owner_verification, only: [:edit, :update, :destroy]

	def index
		if user_signed_in?
			@events = current_user.events_feed.order('created_at DESC').page params[:page]
		else
			@events = Event.all.order('created_at DESC').page params[:page]
		end
	end

	def new
		@event = current_user.events.build
	end

	def create
		@event = current_user.events.build(event_params)
		if @event.save
			flash[:success] = "Event created!"
			redirect_to root_path
		else
			flash.now[:alert] = "Event could not be created."
			render :new
		end
	end

	def show
		@owner = User.find_by(id: @event.user_id)
	end

	def edit
	end

	def update
		if @event.update(event_params)
			flash[:success] = "Event updated!"
			redirect_to event_path(@event)
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
		@event.liked_by current_user
		create_notification @event
		respond_to do |format|
			format.html { redirect_to :back }
			format.js
		end
	end

	def unlike
		@event.unliked_by current_user
		create_notification @event
		respond_to do |format|
			format.html { redirect_to :back }
			format.js
		end
	end

	def browse
		@events = Event.all.order('created_at DESC').page params[:page]
	end

	private
	def create_notification(event)
		return if event.user.id == current_user.id
		Notification.create(user_id: event.user.id,
												notified_by_id: current_user.id,
												event_id: event.id,
												identifier: event.id,
												notice_type: 'like')
	end
	
	def event_params
		params.require(:event).permit(:user_id, :image, :name, :location, :date, :event_time, :details)
	end

	def set_event
		@event = Event.find(params[:id])
	end

	def event_owner_verification
		unless current_user.id == @event.user_id
			flash[:alert] = "Not allowed to edit event"
			redirect_to root_path
		end
	end
end
