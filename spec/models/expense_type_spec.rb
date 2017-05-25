RSpec.describe ExpenseType, type: :model do

  it 'requires a name' do
    expense_type = FactoryGirl.build(:expense_type, :missing_name)
    expense_type.valid?
    expect(expense_type.errors[:name]).to include("can't be blank")
  end

  it 'saves to the database with valid attributes' do
    expect{FactoryGirl.create(:expense_type)}.to change(ExpenseType, :count).by(1)
  end

end
