#Seeding 25 wiki entries

require 'faker'
 10.times do 
 User.create!(
   email:    Faker::Internet.email,
   password: Faker::Crypto.md5
   )
 end
 users = User.all


25.times do
   Wiki.create!(
 # #3
   title:   Faker::Lorem.sentence,
   body:    Faker::Lorem.paragraph 
   )
 end
 wikis = Wiki.all
 
 puts "Seed finished"
 puts "#{User.count} Users created"
 puts "#{Wiki.count} Wikis created"