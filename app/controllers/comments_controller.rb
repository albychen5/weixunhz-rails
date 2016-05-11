class CommentsController < ApplicationController
	before_action :set_event

	def create
		@comment = @event.comments.build(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			flash[:success] = "Comment successfully added!"
			redirect_to :back
		else
			flash[:alert] = "Comment could not be created."
			render root_path 
		end
	end

	def destroy
		@comment = @event.comments.find(params[:id])

		@comment.destroy
		flash[:success] = "Comment successfully deleted."
		redirect_to root_path
	end

	private
	def comment_params
		params.require(:comment).permit(:content)
	end

	def set_event
		@event = Event.find(params[:event_id])
	end
end