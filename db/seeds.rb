# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

require 'csv'


User.delete_all
Post.delete_all
Comment.delete_all
Tag.delete_all
Category.delete_all
Like.delete_all
Accused.delete_all
Accuser.delete_all

categoryArray = ["World_Leader", "Government", "Politician", "Law", "Celebrity"]
catArr = []
categoryArray.each do |cat|
	catArr << Category.create(title: cat)
end


nick = User.create(name: 'nick', email: 'n@n.com', password: 'n', password_confirmation: 'n', pic: "/me_prof.jpg"); 
rob = User.create(name: 'rob', email: 'r@r.com', password: 'r', password_confirmation: 'r', pic: "/rob.jpeg", twitter: "http://twitter.com/robscharf");
# bane = User.create(name: 'bane', email: 'b@b.com', password: 'b', password_confirmation: 'b', pic: "b.jpg");

50.times do
	User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'test', password_confirmation: 'test', pic: '/me_prof.jpg');
end

CSV.foreach('db/nazi_references-g.csv', :headers => true) do |row|
	# category = Category.find_or_create_by(title: categoryArray.sample)

	accused = Accused.find_or_create_by(title: row['Accused'], category: catArr.sample)
	accuser = Accuser.find_or_create_by(title: row['Accuser'], category: catArr.sample)

	post = Post.create(url: row['Source'], accused: accused, accuser: accuser, context: row['Notes'], quote: row['Quote'],  event_date: row['Date'], user: rob, context: Faker::Lorem.sentence(50))
	post.tags << Tag.find_or_create_by(title: post.accuser.title);
	post.tags << Tag.find_or_create_by(title: post.accused.title);
	rand(1..10).times do
		post.likes << Like.create(user: User.all.sample)
	end
	rand(1..5).times do
		Comment.create(content: Faker::Lorem.sentence(14), user: User.all.sample, post: post)
	end
	
end
