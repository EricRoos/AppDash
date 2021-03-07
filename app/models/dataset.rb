class Dataset < ApplicationRecord
  belongs_to :app
  validates_presence_of :name
end
