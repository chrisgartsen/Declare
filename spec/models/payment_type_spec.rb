RSpec.describe PaymentType, type: :model do

  it 'requires a name' do
    payment_type = FactoryGirl.build(:payment_type, :missing_name)
    payment_type.valid?
    expect(payment_type.errors[:name]).to include("can't be blank")
  end

  it 'saves to the database with valid attributes' do
    expect{FactoryGirl.create(:payment_type)}.to change(PaymentType, :count).by(1)
  end

end
