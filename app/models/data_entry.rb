class DataEntry < ApplicationRecord
  belongs_to :dataset

  before_save :sanitize
  after_commit :copy_to_analytic_db

  broadcasts_to -> (entry) { [entry.dataset, :data_entries ] }, inserts_by: :prepend

  def copy_to_analytic_db
    client = dataset.write_client
    exists = client.find(_id: self.id).count > 0
    if exists
      client.update_one(
        {'_id': self.id},
        data
      )
    else
      client.insert_one(
        {'_id': self.id}.merge(data)
      )
    end
  end


  protected


  def sanitize
    new_data = {}
    self.data ||= {}
    dataset.data_points.pluck(:name).each do |key|
      new_data[key] = data[key] || data[key.to_sym]
    end
    self.data = new_data
  end
end
