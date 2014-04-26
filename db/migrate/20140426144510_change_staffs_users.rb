class ChangeStaffsUsers < ActiveRecord::Migration
  def up
    drop_table :staffs_users
    add_column :staffs, :user_id, :integer
  end

  def down
    remove_column :staffs, :user_id
    create_join_table :staffs, :users
  end
end
