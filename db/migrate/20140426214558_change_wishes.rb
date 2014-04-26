class ChangeWishes < ActiveRecord::Migration
  def up
    drop_table :wishes

    create_table :buckets do |t|
      t.references :user, index: true
      t.references :stuff, index: true
      t.references :change_stuff, index: true
      t.boolean :approve
    end
  end

  def down
    drop_table :buckets

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
