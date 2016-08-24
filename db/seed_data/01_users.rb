puts 'users seed data started...'

people_datas = [
    {email: 'admin1@gmail.com', password: 'admin123!', password_confirmation: 'admin123!' }
]

people_datas.each do |params|
  User.create_with(params).find_or_create_by(email: params[:email])
end

puts 'users seed data Ended....'
