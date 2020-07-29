puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'
buffet_kull = { name: 'Buffet Kull', address: 'Munich', phone_number: '0160 90263782', category: 'french' }
riva_bar =  { name: 'Riva Bar', address: 'Munich', category: 'italian' }
izakaya = { name: 'Izakaya', address: 'Ibiza', phone_number: '089 2737288', category: 'asian fusion' }
shizoo = { name: 'Shizoo', address: 'Munich', category: 'japanese' }
martha = { name: 'Martha', address:'Munich', phone_number: '0175 6272876', category: 'italian'}
limoni = { name: 'Limoni', address:'Munich', phone_number: '0172 8276388', category: 'italian'}

[buffet_kull, riva_bar, izakaya, shizoo, martha, limoni].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end
puts 'Finished!'
