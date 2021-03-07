class AddDbSaltToApp < ActiveRecord::Migration[6.0]
  def change
    add_column :apps, :db_salt, :string
  end
end
