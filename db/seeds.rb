exit if !Rails.env.development?

puts "Deleting the data"
Post.delete_all
User.delete_all

puts "Creating User"
user = FactoryBot.create(:user, email:"test@test.com")

puts "Creating Post"
20.times do 
	post = FactoryBot.create(:post, user: user)
end

