class MongoClient
  def self.admin_client
    client('root', 'password', 'admin')
  end

  def self.client(user, pass, database)
    Mongo::Client.new([ '127.0.0.1:27017' ], user: user, password: pass, database: database)
  end
end
