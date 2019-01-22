class CreateAttendees < ActiveRecord::Migration[5.1]
  def change
    create_table :attendees do |t|
      t.string :email
      t.references :event, foreign_key: true

      t.timestamps
    end
    add_index :attendees, [:event_id, :created_at]
  end
end
