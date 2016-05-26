class RemoveEventDateFromParticipations < ActiveRecord::Migration
  def change
  	remove_column :participations, :event_date
  end
end
