json.array!(@postulations) do |postulation|
  json.extract! postulation, :id, :program_id, :name, :surname, :second_surname, :rut, :birthdate, :birthplace, :nationality, :phone, :mobile_phone, :message_phone, :email, :address, :commune, :city, :degree_school, :degree, :degree_country, :degree_year, :other_degree, :other_degree_country, :other_degree_year, :occupation, :work_address, :work_commune, :work_city, :work_phone, :work_email, :observations, :find_out_id, :financing_id
  json.url postulation_url(postulation, format: :json)
end
