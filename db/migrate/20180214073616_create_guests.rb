class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.string :name
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
