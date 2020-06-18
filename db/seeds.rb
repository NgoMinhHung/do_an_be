user = User.create!(
  name: 'Nguyen Van Man'
)

user.create_account(
  email: 'nhinguyen@gmail.com',
  password: '12345678'
)

user.create_config

Category.create!(
  name: 'Food'
)

user.transaction_items.create!(
  amount: 200000,
  note: 'Buy garena card',
  time: DateTime.now
)
