class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|

    	t.string :name
    	t.string :info

      t.timestamps null: false
    end
  end
end
