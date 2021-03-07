class CreateDataEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :data_entries do |t|
      t.references :dataset, null: false, foreign_key: true
      t.jsonb :data, null: false, defauult: {}
      t.timestamps
    end
  end
end
