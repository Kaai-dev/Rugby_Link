Position.destroy_all

positions = [
  'Loosehead Prop', 'Hooker', 'Tighthead Prop',
  'Lock', 'Lock',
  'Blindside Flanker', 'Openside Flanker', 'Number Eight',
  'Scrum-Half', 'Fly-Half',
  'Left Wing', 'Inside Centre', 'Outside Centre',
  'Right Wing', 'Fullback'
]

positions.each_with_index do |position_name, index|
  Position.find_or_create_by(position: position_name, number: index + 1)
end

puts 'Positions table seeded Successfully.'
