class AddInfoToEvents < ActiveRecord::Migration
  def change
    add_column :events, :location, :text
    add_column :events, :date, :string
    add_column :events, :details, :text
  end
end
