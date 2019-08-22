class CreateObservers < ActiveRecord::Migration[5.2]
  def change
    create_table :observers do |t|
      t.string :class_list
      t.integer :processes_count, default: 0
      t.integer :processed_count, default: 0
      t.string :status
      t.date :date

      t.timestamps
    end
  end
end
