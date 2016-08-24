puts 'people seed data started...'

people_datas = [
    {:name => "suresh", :description=>"Suresh" },
    {:name => "kumar", :description=>"Kumar" },
    {:name => "kishore", :description=>"kishore" },
    {:name => "prem", :description=>"Prem" },
]

people_datas.each do |params|
  Person.create_with(params).find_or_create_by(name: params[:name])
end

puts 'people seed data Ended....'
