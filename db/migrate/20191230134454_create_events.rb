class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :address
      t.string :event_type
      t.float :price
      t.string :date_time
      t.boolean :available?
      t.integer :organiser_id
      t.integer :venue_id
      t.timestamp :created_on
    end
  end
end
