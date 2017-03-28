RSpec.describe BootstrapFormbuilder do

  describe '#submit_button_group' do

    let(:project) { FactoryGirl.build(:project) }
    let(:builder) { BootstrapFormbuilder.new(:project, project, self, {})}
    let(:output) { builder.submit_button_group() }

    describe 'submit_button' do

      it 'has a submit button with a default caption'

      it 'accepts the caption as a parameter'

      it 'has no back button by default'

      it 'has a back button when a back-url is specified'

      it 'is wrapped in a group div'

    end


  end

end
