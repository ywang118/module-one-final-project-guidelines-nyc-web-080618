class CreateEventOrganizers < ActiveRecord::Migration[5.0]
  def change
    create_table :event_organizers do |t|
      t.integer :event_id
      t.integer :organizer_id
      t.boolean :is_organizer
    end
  end
end
