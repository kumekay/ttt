class AddDesriptionToStaffs < ActiveRecord::Migration
  def change
    add_column :staffs, :description, :string
  end
end
