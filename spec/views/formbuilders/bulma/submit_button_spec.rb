RSpec.describe BulmaFormbuilder do

  let(:project) { FactoryGirl.build(:project) }
  let(:builder) { BulmaFormbuilder.new(:project, project, self, {})}


  describe '#submit_button' do

    it 'has a button' do

    end

  end

end
