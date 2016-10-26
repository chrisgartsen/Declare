require 'rails_helper'

RSpec.describe User, type: :model do

  it 'requires a name' do
    user = FactoryGirl.build(:user, :missing_name)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'has a unique name' do
    FactoryGirl.create(:user)
    user = FactoryGirl.build(:user)
    user.valid?
    expect(user.errors[:name]).to include("has already been taken")
  end

  it 'requires an email' do
    user = FactoryGirl.build(:user, :missing_email)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'has a unique email' do
    FactoryGirl.create(:user)
    user = FactoryGirl.build(:user)
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  xit 'requires a password' do
    user = FactoryGirl.build(:user, :missing_password)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  xit 'requires a password confirmation to match password' do
    user = FactoryGirl.build(:user, :password_mismatch)
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end

  it 'is not an admin by default' do
    user = FactoryGirl.create(:user)
    expect(user.admin).to be_falsey
  end

  it 'is inactive by default' do
    user = FactoryGirl.create(:user)
    expect(user.active).to be_falsey
  end

  it 'saves to the database when valid' do
    expect{FactoryGirl.create(:user)}.to change(User, :count).by(1)
  end

  it 'stores the password salt and hash' do
    user = FactoryGirl.create(:user)
    expect(user.password_salt).not_to be_nil
    expect(user.password_hash).not_to be_nil
  end

  xit 'has a hashed password' do
    user = FactoryGirl.create(:user)
    expect(user.password_hash).to eq(BCrypt::Engine.hash_secret('Secret', user.password_salt))
  end

  xit 'activates the user' do
    user = FactoryGirl.create(:user, :inactive)
    user.activate
    expect(user.active).to be_truthy
  end

  xit 'inactivates the user' do
    user = FactoryGirl.create(:user, :active)
    user.inactivate
    expect(user.active).to be_falsey
  end

  xit 'authenticates with the correct password' do
    user = FactoryGirl.create(:user)
    expect(user.authenticate(user.password)).to be_truthy
  end

  xit 'does not authenticate with the wrong password' do
    user = FactoryGirl.create(:user)
    expect(user.authenticate('WRONG')).to be_falsey
  end

  xit 'does not authenticate without a password' do
    user = FactoryGirl.create(:user)
    expect(user.authenticate(nil)).to be_falsey
  end

end
