puts 'expenses seed data started...'

event_id = Event.first.try(:id)
person1 = Person.pluck(:id)
expenses_datas = [

{ location: "chennai", event_id: event_id, exp_date: Date.today, total_amount: 1200.0 , person: { person1[0] =>{ amount: 100.0 }, person1[1] =>{ amount: 300.0 }, person1[2] =>{ amount: 800.0} } },
{ location: "bangalore", event_id: event_id, exp_date: Date.today, total_amount: 1500.0 , person: { person1[0] =>{ amount: 100.0 }, person1[1] =>{ amount: 1000.0 }, person1[2] =>{ amount: 400.0} } },
{ location: "mumbai", event_id: event_id, exp_date: Date.today, total_amount: 1000.0 , person: { person1[0] =>{ amount: 0.0 }, person1[1] =>{ amount: 900.0 }, person1[2] =>{ amount: 100.0} } },
{ location: "madurai", event_id: event_id, exp_date: Date.today, total_amount: 500.0 , person: { person1[0] =>{ amount: 100.0 }, person1[1] =>{ amount: 300.0 }, person1[2] =>{ amount: 100.0} } },
{ location: "pune", event_id: event_id, exp_date: Date.today, total_amount: 1200.0 , person: { person1[0] =>{ amount: 100.0 }, person1[1] =>{ amount: 700.0 }, person1[2] =>{ amount: 400.0} } }

]

expenses_datas.each do |params|
  Expense.create_expense(params)
end

puts 'expenses seed data Ended....'

