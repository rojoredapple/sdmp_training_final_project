class CreateAttendees < ActiveRecord::Migration[5.1]
  def change
    create_table :attendees do |t|
      t.string :email
      t.integer :event_id

      t.timestamps
    end
  end
end
