user = User.new(username:  "test",
                email: "test@test.com",
                birthday: "2016-07-24",
                password: "password",
                password_confirmation: "password"
                )
user.skip_confirmation!
user.save
