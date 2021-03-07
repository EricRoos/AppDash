class CreateDataPoints < ActiveRecord::Migration[6.0]
  def change
    create_table :data_points do |t|
      t.references :dataset, null: false, foreign_key: true
      t.string :name
      t.string :data_type

      t.timestamps
    end
  end
end
