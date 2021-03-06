# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test_user = User.create!(first_name: 'Testing', last_name: 'User', email: 'user@test.com',
                         password: 'password', password_confirmation: 'password',
                         token: '94d0676cd3a0f7644b30ac404a5d5292bdf2a39225a5f76806740872928f0080', 
                         refresh: '31f9144420feef7f3b6516a6ac6d256cf6895eddf2cefa299a1ee3001ac6ab05' 
                        )

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

user_3 = User.create!(first_name: 'Me', last_name: 'Myself', email: 'me@me.com',
                      password: 'hamburger1', password_confirmation: 'hamburger1',
                      token: 'aa2957980f434f5cf33e9b85f943ccdc83dfa5b6663bcbb1054ac206365893c0', 
                      refresh: 'e37fc760e82d4de58e82a50dbbd4c83e72e2580e4b1fd74fa6d3ade1007886b1' 
                      )
