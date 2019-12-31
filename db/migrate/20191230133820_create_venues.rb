class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :venue_type
      t.integer :city_id
      t.timestamp :created_on
    end
  end
end
