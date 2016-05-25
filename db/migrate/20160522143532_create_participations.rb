class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :event, index: true

    	t.datetime :event_date
      t.timestamps null: false
    end
  end
end
