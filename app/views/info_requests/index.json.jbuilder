json.array!(@info_requests) do |info_request|
  json.extract! info_request, :id, :program_id, :name, :surname, :second_surname, :rut, :observations, :find_out_id
  json.url info_request_url(info_request, format: :json)
end
