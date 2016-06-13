class GroupsController < ApplicationController
	before_action :set_group, except: [:index]

	def index
		#index shows all groups current user is a part of
		@groups = Group.all
		#if not logged in index will prompt user to login/signup
	end

	def new
		#create a new group
		@group = Group.new
		#set current user to admin
	end

	def create
		#save created group
		@group = Group.new(group_params)
		if @group.save
			@group_relationship = GroupRelationship.new
			@group_relationship.admin = true
			@group_relationship.user_id = current_user.id
			@group_relationship.group_id = @group.id
			redirect_to events_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @group.update
			redirect_to events_path
		else
			render :edit
		end
	end

	def show
		@events = Event.all.order('created_at DESC')
		@proposals = Proposal.order(cached_votes_up: :desc)
	end

	def destroy
		@group.destroy
		redirect_to events_path
	end

	private

	def group_params
		params.require(:group).permit(:name, :info)
	end

	def set_group
		@group = Group.find(params[:id])
	end

end
