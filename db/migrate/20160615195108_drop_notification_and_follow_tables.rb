class DropNotificationAndFollowTables < ActiveRecord::Migration
  def change
  	drop_table :notifications
  	drop_table :follows
  end
end
