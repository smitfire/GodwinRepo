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

legendArray = ["World_Leader", "Government", "Politician", "Law", "Celebrity"]
myColorArray = ['yellow', 'red',' blue',' green',' orange']
nick = User.create(name: 'nick', email: 'n@n.com', password: 'n', password_confirmation: 'n', pic: "me_prof.jpg"); 
rob = User.create(name: 'rob', email: 'r@r.com', password: 'r', password_confirmation: 'r', pic: "rob.jpeg");
bane = User.create(name: 'bane', email: 'b@b.com', password: 'b', password_confirmation: 'b', pic: "b.jpg");

15.times do 
	post = Post.create(url: Faker::Internet.url, excerpt: Faker::Lorem.paragraph(6), title: Faker::Name.name, date: rand(10.years).ago.to_formatted_s(:long), target: Faker::Name.name, accuser: Faker::Name.name, category: legendArray.sample);
	
	post.tags << Tag.find_or_create_by(title: post.category);
	post.tags << Tag.find_or_create_by(title: post.accuser);
	post.tags << Tag.find_or_create_by(title: post.target);

	5.times do
		post.comments << Comment.create(content: Faker::Lorem.sentence(14), author_id: nick.id)
	end
	
	rob.posts << post 
end

15.times do 
	post = Post.create(url: Faker::Internet.url, excerpt: Faker::Lorem.paragraph(6), title: Faker::Name.name, date: rand(10.years).ago.to_formatted_s(:long), target: Faker::Name.name, accuser: Faker::Name.name, category: legendArray.sample);

	post.tags << Tag.find_or_create_by(title: post.category);
	post.tags << Tag.find_or_create_by(title: post.accuser);
	post.tags << Tag.find_or_create_by(title: post.target);

	5.times do
		post.comments << Comment.create(content: Faker::Lorem.sentence(14), author_id: rob.id)
	end
	bane.posts << post 
end

15.times do 
	post = Post.create(url: Faker::Internet.url, excerpt: Faker::Lorem.paragraph(6), title: Faker::Name.name, date: rand(10.years).ago.to_formatted_s(:long), target: Faker::Name.name, accuser: Faker::Name.name, category: legendArray.sample);


	post.tags << Tag.find_or_create_by(title: post.category);
	post.tags << Tag.find_or_create_by(title: post.accuser);
	post.tags << Tag.find_or_create_by(title: post.target);

	5.times do
		post.comments << Comment.create(content: Faker::Lorem.sentence(1), author_id: bane.id)
	end
	nick.posts << post 
end  