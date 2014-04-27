class AddTimestampToBuckets < ActiveRecord::Migration
  def change
    change_table(:buckets) { |t| t.timestamps }
  end
end
