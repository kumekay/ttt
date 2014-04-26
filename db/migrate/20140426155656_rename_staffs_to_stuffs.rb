class RenameStaffsToStuffs < ActiveRecord::Migration
  def change
    rename_table :staffs, :stuffs
  end
end
