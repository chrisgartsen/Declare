RSpec.describe Expense, type: :model do

  it 'saves to the database with valid attributes' do
    expect{FactoryGirl.create(:expense)}.to change(Expense, :count).by(1)
  end

  it 'requires a project' do
    expense = FactoryGirl.build(:expense, :missing_project)
    expense.valid?
    expect(expense.errors[:project]).to include("can't be blank")
  end

  it 'requires a payment type' do
    expense = FactoryGirl.build(:expense, :missing_payment_type)
    expense.valid?
    expect(expense.errors[:payment_type]).to include("can't be blank")
  end

  it 'requires an expense type'
  it 'requires a currency'
  it 'requires an expense date'
  it 'requires an amount'

end
