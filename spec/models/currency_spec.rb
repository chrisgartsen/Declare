RSpec.describe Currency, type: :model do

  it 'requires a name' do
    currency = FactoryGirl.build(:currency, :missing_name)
    currency.valid?
    expect(currency.errors[:name]).to include("can't be blank")
  end

  it 'requires a code' do
    currency = FactoryGirl.build(:currency, :missing_code)
    currency.valid?
    expect(currency.errors[:code]).to include("can't be blank")
  end

  it 'saves to the database with valid attributes' do
    expect { FactoryGirl.create(:currency) }.to change(Currency, :count).by(1)
  end

end
