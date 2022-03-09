class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.text :s_contents
      t.integer :month
      t.integer :status

      t.timestamps
    end
  end
end
