3.times do |n|
  user = User.new(username:  "#{n}",
                  email: "#{n}@test.com",
                  birthday: "2016-07-24",
                  password: "password",
                  password_confirmation: "password"
                  )
  user.skip_confirmation!
  user.save
end

3.times do |n|
  Book.create(user_id: 1,
           title: "#{n}",
           author: "#{n}",
           status: 1)
  Book.create(user_id: 1,
           title: "#{n}",
           author: "#{n}",
           status: 1)
end


require "csv"

Prefecture.delete_all
namelist = Array.new
CSV.foreach('db/prefecturals_name_seed.csv') do |row|
  record = {
    id:   row[0].to_i,
    name: row[1]
  }
  p record
  name = Prefecture.create!(record)
  namelist[name.id] = name
end

Area.delete_all
CSV.foreach('db/postal_code_seed.csv') do |row|
  record = {
    postal_code:  row[0],
    prefecture:   namelist[row[1].to_i],
    municipality: row[3],
    street:       row[4]
  }
  p record
  Area.create!(record)
end
