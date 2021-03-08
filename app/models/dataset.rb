class Dataset < ApplicationRecord
  belongs_to :app
  has_many :data_points
  has_many :data_entries

  validates_presence_of :name

  def entries(filters={}, page: 1, per_page: 10)
    query = analytic_client.find(filters).skip(per_page * ( page- 1)).limit(per_page)
    total_match = query.estimated_document_count
    { records: query.to_a, total_match: total_match }
  end

  def analytic_client
    @analytic_client ||= app.analytic_client["dataset#{id}"]
  end

  def write_client
    @write_client ||= app.write_client["dataset#{id}"]
  end
end
