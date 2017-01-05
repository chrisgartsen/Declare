User.delete_all

# Users

User.create(name: 'chris', password: 'chris', password_confirmation: 'chris', email: 'chris@email.com')
User.create(name: 'guest', password: 'guest', password_confirmation: 'guest', email: 'guest@email.com')
User.create(name: 'admin', password: 'admin', password_confirmation: 'admin', email: 'admin@email.com', admin: true)

p "Seed created #{User.count} users"
