class AddWechatToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :wechat_id, :string
    add_index :users, :wechat_id, unique: true
  end
end
