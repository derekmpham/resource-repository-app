class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.integer :favoriter_id
      t.integer :resource_id

      t.timestamps
    end
  end
end
