class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
    	t.string :name
    	t.string :phone_number
    	t.belongs_to :event, index: true

      t.timestamps null: false
    end
  end
end
