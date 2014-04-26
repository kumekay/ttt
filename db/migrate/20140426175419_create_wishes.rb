class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.references :wisher, index: true
      t.references :owner, index: true

      t.references :wisher_stuff, index: true
      t.references :owner_stuff, index: true

      t.integer :wisher_approve
      t.integer :owner_approve

      t.timestamps
    end
  end
end
