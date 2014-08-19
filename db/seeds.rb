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

category_arr = [
	["WLP","World Leader or Politician"], 
	["CML", "Country, Administration or Law"],
	["PPP" , "Party, Pol. Organization, Philosophy"],
	["CP" , "Celebrity or Prominent Indiv"], 
	["PJN" ,"Pundit, Journalist, or News Outlet"] ,
	["M" ,"Misc"]
]
category_arr.each do |cat|
	Category.create(key: cat[0], title: cat[1])
end

rob = User.create(name: 'rob', email: 'r@r.com', password: 'r', password_confirmation: 'r', pic: "/rob.jpeg", twitter: "http://twitter.com/robscharf");
50.times do
	User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'test', password_confirmation: 'test', pic: '/me_prof.jpg');
end

CSV.foreach('db/nazi_references_2.csv', :headers => true) do |row|
	
	accused_category = Category.find_or_create_by(key: row['Accused Category'])
	accuser_category = Category.find_or_create_by(key: row['Accuser Category'])

	accused = Accused.find_or_create_by(title: row['Accused'], category: accused_category)
	accuser = Accuser.find_or_create_by(title: row['Accuser'], category: accuser_category)

	post = Post.create(url: row['Source'], accused: accused, accuser: accuser, context: row['Notes'], quote: row['Quote'],  event_date: row['Date'], user: rob)

	post.tags << Tag.find_or_create_by(title: post.accuser.title);
	post.tags << Tag.find_or_create_by(title: post.accused.title);

	rand(1..10).times do
		post.likes << Like.create(user: User.all.sample)
	end
	rand(1..5).times do
		Comment.create(content: Faker::Lorem.sentence(14), user: User.all.sample, post: post)
	end
	
end
