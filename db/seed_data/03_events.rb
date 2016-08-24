puts 'events seed data started...'

events_datas = [
    {:name => "breakfast", :description=>"Breakfast" },
    {:name => "lunch", :description=>"Lunch" },
    {:name => "dinner", :description=>"Dinner" }
]

events_datas.each do |params|
  Event.create_with(params).find_or_create_by(name: params[:name])
end

puts 'events seed data Ended....'
