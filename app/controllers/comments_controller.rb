class CommentsController < ApplicationController
	before_action :set_event

	def index
		@comments = @event.comments.order("created_at ASC")

		respond_to do |format|
			format.html { render layout: !request.xhr? }
		end
	end

	def create
		@comment = @event.comments.build(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			create_notification @event, @comment
			respond_to do |format|
				format.html { redirect_to root_path }
				format.js
			end
		else
			flash[:alert] = "Comment could not be created."
			render root_path 
		end
	end

	def destroy
		@comment = @event.comments.find(params[:id])

		if @comment.user_id == current_user.id
			@comment.delete
			respond_to do |format|
				format.html { redirect_to root_path }
				format.js
			end
		end
	end

	private

	def create_notification(event, comment)
		return if event.user.id == current_user.id
		Notification.create(user_id: event.user.id,
												notified_by_id: current_user.id,
												event_id: event.id,
												identifier: comment.id,
												notice_type: 'comment')
	end

	def comment_params
		params.require(:comment).permit(:content)
	end

	def set_event
		@event = Event.find(params[:event_id])
	end

end