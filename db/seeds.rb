load_seed_files = [
    '01_users.rb',
    '02_people.rb',
    '03_events.rb',
    '04_expenses.rb'
]
load_seed_files.each do |seed_file|
  require File.expand_path(File.dirname(__FILE__))+"/seed_data/#{seed_file}"
end

puts "\n"
puts "Clearing menu cache..."
Rails.cache.clear
