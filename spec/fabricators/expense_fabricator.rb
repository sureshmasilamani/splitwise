Fabricator(:expense) do
  location "bangalore"
  exp_date Date.today
  event{Fabricate(:event)}
  total_amount 1200
end