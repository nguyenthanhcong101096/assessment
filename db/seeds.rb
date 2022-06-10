if User.count.zero?
	User.create(
		username: 'testuser',
		email: Faker::Internet.free_email,
		password: 'TestPassword1!'
	)
end