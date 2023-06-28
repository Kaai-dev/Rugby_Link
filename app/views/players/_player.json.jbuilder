json.extract! player, :id, :nickname, :fullname, :cellphone_number, :player_position, :medical_conditions, :has_id, :did_highschool, :medical_aid, :created_at, :updated_at
json.url player_url(player, format: :json)
