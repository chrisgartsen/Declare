# Cascade the delete manually

Project.delete_all

# Users

User.delete_all

User.create(name: 'chris', password: 'chris', password_confirmation: 'chris', email: 'chris@email.com')
User.create(name: 'guest', password: 'guest', password_confirmation: 'guest', email: 'guest@email.com')
User.create(name: 'admin', password: 'admin', password_confirmation: 'admin', email: 'admin@email.com', admin: true)

p "Seed created #{User.count} users"

# Currencies

Currency.delete_all

Currency.create(code: 'EUR', name: 'Euro')
Currency.create(code: 'GBP', name: 'Pound Sterling')
Currency.create(code: 'USD', name: 'US Dollars')
Currency.create(code: 'HKD', name: 'Hong Kong Dollars')
Currency.create(code: 'DKK', name: 'Danish Krone')
Currency.create(code: 'JPY', name: 'Japanese Yen')

p "Seed created #{Currency.count} currencies"

# Expense types

ExpenseType.delete_all

ExpenseType.create(name: 'Cash expense')
ExpenseType.create(name: 'Travel expense')
ExpenseType.create(name: 'Parking cost')
ExpenseType.create(name: 'Hotel stay')
ExpenseType.create(name: 'Public transport')

p "Seed created #{ExpenseType.count} expense types"
