User.create(email: "test@test.com", password: "password", password_confirmation: "password")
10.times do 
  Board.create(
    name: Faker::Job.field
  )
end