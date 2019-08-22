class CreateObserveds < ActiveRecord::Migration[5.2]
  def change
    create_table :observeds do |t|
      t.string :class_name
      t.integer :object_id
      t.string :status
      t.references :observer, foreign_key: true

      t.timestamps
    end
  end
end
