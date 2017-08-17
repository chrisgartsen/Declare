RSpec.describe BulmaFormbuilder do

  let(:project) { FactoryGirl.build(:project) }
  let(:builder) { BulmaFormbuilder.new(:project, project, self, {})}


  describe '#submit_button' do

    it 'has a button' do

      expect(builder.submit()).to have_selector("input[type='submit']")

    end

  end

end
