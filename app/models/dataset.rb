class Dataset < ApplicationRecord
  belongs_to :app
  has_many :data_points
  has_many :data_entries

  validates_presence_of :name

  def entries(filters={})
    analytic_client.find(filters).to_a
  end

  def analytic_client
    @analytic_client ||= app.analytic_client["dataset#{id}"]
  end

  def write_client
    @write_client ||= app.write_client["dataset#{id}"]
  end
end
