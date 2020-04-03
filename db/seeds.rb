User.create!(name:  "testユーザー",
             email: "test@pajama.org",
             password:              "pajama",
             password_confirmation: "pajama")

30.times do |n|
  gimei  = Gimei.name
  name = gimei.romaji
  email = "example-#{n+1}@pajamas.org"
  password = "#{name} + password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end