class App < ApplicationRecord
  has_many :datasets

  after_commit :create_analytic_db, on: :create
  def analytic_client
    MongoClient.client(mongo_access_user, base_password+db_salt, mongo_db_id)
  end

  def write_client
    MongoClient.admin_client.use(mongo_db_id)
  end

  def db_password
    db_salt + base_password
  end

  def create_analytic_db
    if db_salt.blank?
      update(db_salt: SecureRandom.hex(32))
      self.reload
    end


    client = MongoClient.admin_client
    client.use(mongo_db_id).database
      .users
      .create(
        mongo_access_user,
        password: base_password + self.db_salt,
        roles: [ Mongo::Auth::Roles::READ]
      )
    client.close
  end

  def mongo_db_id
    "app-#{id}"
  end

  def mongo_access_user
    "web"
  end

  def base_password
    'PASSWORD'
  end


end
