User.create!(name:  "testユーザー",
             email: "test@pajama.org",
             password:              "pajama",
             password_confirmation: "pajama")

User.create!(name:  "gestユーザー",
             email: "gest@pajama.org",
             password:              "pajama_gest",
             password_confirmation: "pajama_gest")

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

message = [ 
            "今日はお揃いのパジャマで寝ます。",
            "人生で初めてちゃんとした部屋着買いました。",
            "何かいい部屋着ないですか。",
            "あのブランドから出た部屋着可愛いですよね。",
            "マジうける",
            "部屋着なんて適当でいいと思っててごめん",
            "ジェラピケ最高。",
            "男だけどパジャマにこだわってるよ",
            "このサイト面白いと思う",
            "真剣にこのサイト見てます"
          ]
id = [1,2,3,4,5,6,7,8,9,10]
10.times do |n|
  @micropost = Micropost.create!(content: message[n],user_id: id[n])
end