class AddAttendeeInfoToParticipation < ActiveRecord::Migration
  def change
  	add_column :participations, :attendee_name, :string
  	add_column :participations, :attendee_email, :string
  end
end
