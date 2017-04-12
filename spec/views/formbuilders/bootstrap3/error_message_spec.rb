RSpec.describe BootstrapFormbuilder do

  describe '#error_message_group' do

    context 'without errors' do

      let(:project) { FactoryGirl.build(:project) }
      let(:builder) { BootstrapFormbuilder.new(:project, project, self, {}) }
      let(:output) {builder.error_message_group }

      it 'does not render errormessages' do
        expect(output).not_to have_selector 'div.alert.alert-danger'
      end

    end

    context 'with errors' do

      let(:project) { FactoryGirl.build(:project, :missing_name) }
      let(:builder) { BootstrapFormbuilder.new(:project, project, self, {}) }
      let(:output) {builder.error_message_group }

      before(:each) do
        project.errors.add(:name, 'First Errormessage')
        project.errors.add(:name, 'Second Errormessage')
      end

      it 'shows errormessages in an alert div' do
        expect(output).to have_selector 'div.alert.alert-danger'
      end

      it 'it has a header' do
        expect(output).to have_selector 'strong', text: 'A problem has occurred while submitting your data.'
      end

      it 'shows an errormessage subheader' do
        expect(output).to have_selector 'p', text: '2 errors prohibited this Project from being saved:'
      end

      it 'shows the errormessages' do
        expect(output).to have_selector 'ul'
        expect(output).to have_selector 'li', count: 2
      end

    end

  end

end
