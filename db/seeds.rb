# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create!(first_name: 'Boss', last_name: 'Baby', email: 'boss@me.com',
                     password: 'imabossbaby', password_confirmation: 'imabossbaby',
                     token: '4355f094978ce1c7dbc074a8a07056b402b60f13adbb39f2893becd9dc256e9d',
                     refresh: '301c9c023c798d38a0c97067b8164b9cd0eb2e91827e9e28ad8e4208c35f4453', 
                     role: 1)

user_1 = User.create!(first_name: 'Justa', last_name: 'User', email: 'user@me.com',
                      password: 'imjustauser', password_confirmation: 'imjustauser',
                      token: '4ff34069ded782a13d7e9685d4c25f86b0393b2c68f2a8f0204993557f78a204', 
                      refresh: '7ff7f9aa4a56830b1044c5a173a9ae35a855daf24a98c9392e4e8a842bcc0d8f' 
                      )

user_2 = User.create!(first_name: 'Just', last_name: 'Anotheruser', email: 'user2@me.com',
                      password: 'anotheruser', password_confirmation: 'anotheruser',
                      token: '4a03a329ebdc460be35d452132e9fa671279da9e236bf1b115beb1815baf3996', 
                      refresh: '70399b9ad64130d9e85aab6f4e96144225330113704a62c4ea1afbe1262dca2b'
                      )
