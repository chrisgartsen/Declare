require 'rails_helper'

RSpec.describe Project, type: :model do

  it 'requires a name' do
    project = FactoryGirl.build(:project, :missing_name)
    project.valid?
    expect(project.errors[:name]).to include("can't be blank")
  end

  it 'belongs to a user' do
    project = FactoryGirl.build(:project, :missing_user)
    project.valid?
    expect(project.errors[:user_id]).to include("can't be blank")
  end

  it 'saves to the database with valid attributes' do
    expect{FactoryGirl.create(:project)}.to change(Project, :count).by(1)
  end

  it 'has a total amount with default zero' do
    project = FactoryGirl.create(:project)
    expect(project.total_amount).to eq 0
  end

  it 'has an outstanding amount with default zero' do
    project = FactoryGirl.create(:project)
    expect(project.outstanding_amount).to eq 0
  end

end
