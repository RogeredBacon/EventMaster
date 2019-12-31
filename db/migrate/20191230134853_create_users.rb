class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :organiser?
      t.timestamp :created_on
    end
  end
end
