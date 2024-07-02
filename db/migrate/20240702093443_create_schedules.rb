class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.integer  :schedule_id, null: false
      t.timestamps
    end
  end
end
