class CreateOrganisers < ActiveRecord::Migration[5.2]
  def change
    create_table :organisers do |t|
      t.string :name
      t.timestamp :created_on
    end
  end
end
