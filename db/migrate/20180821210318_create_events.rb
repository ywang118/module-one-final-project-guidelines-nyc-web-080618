class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location_borough
      t.datetime :time
      t.integer :cost
    end
  end
end
