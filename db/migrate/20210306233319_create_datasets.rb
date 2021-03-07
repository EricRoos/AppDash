class CreateDatasets < ActiveRecord::Migration[6.0]
  def change
    create_table :datasets do |t|
      t.references :app, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
