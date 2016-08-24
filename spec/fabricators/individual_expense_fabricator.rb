Fabricator(:individual_expense) do
  expense{Fabricate(:expense)}
  person{Fabricate(:person)}
  amount 1200
end