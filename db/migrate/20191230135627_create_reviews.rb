class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :description
      t.float :rating
      t.integer :user_id
      t.integer :ticket_id
      t.timestamp :created_on
    end
  end


