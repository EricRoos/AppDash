json.extract! data_point, :id, :dataset_id, :name, :type, :created_at, :updated_at
json.url data_point_url(data_point, format: :json)
