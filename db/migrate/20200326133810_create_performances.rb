class CreatePerformances < ActiveRecord::Migration[6.0]
  def change
    create_table :performances do |t|
      t.string :name
      t.daterange :duration

      t.timestamps
    end
  end
end
