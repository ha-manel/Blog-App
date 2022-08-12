# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
user2 = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

post1 = Post.create(author: user1, title: 'Hello', text: 'This is my first post')
post2 = Post.create(author: user1, title: 'Hello', text: 'This is my second post')
post3 = Post.create(author: user2, title: 'Hello', text: 'This is my first post')
post4 = Post.create(author: user2, title: 'Hello', text: 'This is my second post')

comment1 = Comment.create(post: Post.first,author: User.first, text: 'Hi Lilly!' )
comment2 = Comment.create(post: Post.first,author: User.second, text: 'Hi Tom!' )
comment3 = Comment.create(post: Post.second,author: User.second, text: 'Hi!' )
comment4 = Comment.create(post: Post.second,author: User.first, text: 'Hey!' )
comment5 = Comment.create(post: Post.third,author: User.first, text: 'Hi there!' )
comment6 = Comment.create(post: Post.third,author: User.second, text: 'Hello!' )

user = User.find_by(name: 'Tom')
user_update = User.find_by(name: 'Tom').update(bio: 'Developer from Mexico')
user3 = User.create(name: 'Annie', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Doctor from Germany.')
user3.destroy
