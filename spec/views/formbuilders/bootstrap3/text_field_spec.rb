RSpec.describe BootstrapFormbuilder do

  describe '#text_field_group' do

    let(:project) { FactoryGirl.build(:project) }
    let(:builder) { BootstrapFormbuilder.new(:project, project, self, {})}
    let(:output) { builder.text_group(:name) }

    describe 'text_field' do

      it 'has a textfield with the correct name' do
        expect(output).to have_selector('input[type="text"]')
        expect(output).to have_selector('input[name="project[name]"]')
        expect(output).to have_selector('input[id="project_name"]')
      end

      it 'has a css of class form-control' do
        expect(output).to have_selector('input.form-control')
      end

      it 'is wrapped in a div with a default with' do
        expect(output).to have_selector('div.col-sm-6 input')
      end

    end

    describe 'label' do

      it 'has a caption' do
        expect(output).to have_selector('label', text: 'Name')
      end

      it 'has a ccs of class control-label and a default with' do
        expect(output).to have_selector('label.control-label')
        expect(output).to have_selector('label.col-sm-4')
      end

      it 'refers back to the input field' do
        expect(output).to have_selector('label[for="project_name"]')
      end

    end

    describe 'group' do

      it 'is wrapped in a div with a css of form-group' do
        expect(output).to have_selector('div.form-group')
      end

    end

  end

end
