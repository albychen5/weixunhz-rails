class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :name
      t.text :info
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
