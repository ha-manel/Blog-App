# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1492681290082-e932832941e6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80', bio: 'Teacher from Mexico.')
user2 = User.create(name: 'Lilly', photo: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', bio: 'Teacher from Poland.')
user3 = User.create(name: 'John', photo: 'https://images.unsplash.com/photo-1492681290082-e932832941e6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80', bio: 'Developer from Germany.')
user4 = User.create(name: 'Jane', photo: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', bio: 'Singer and mother of two.')

post1 = Post.create(author: user1, title: 'Hello', text: 'This is my first post')
post2 = Post.create(author: user1, title: 'Hello', text: 'This is my second post')
post3 = Post.create(author: user2, title: 'Hello', text: 'This is my first post')
post4 = Post.create(author: user2, title: 'Hello', text: 'This is my second post')
post5 = Post.create(author: user3, title: 'Hello', text: 'This is my first post')

comment1 = Comment.create(post: post1, author: user1, text: 'Hi Lilly!' )
comment2 = Comment.create(post: post1, author: user2, text: 'Hi Tom!' )
comment3 = Comment.create(post: post2, author: user2, text: 'Hi!' )
comment4 = Comment.create(post: post2, author: user1, text: 'Hey!' )
comment5 = Comment.create(post: post3, author: user1, text: 'Hi there!' )
comment6 = Comment.create(post: post3, author: user3, text: 'Hello!' )
comment6 = Comment.create(post: post4, author: user4, text: 'Hello!' )
