RSpec.describe BulmaFormbuilder do

  describe '#text_field_horizontal' do

    let(:project) { FactoryGirl.build(:project) }
    let(:builder) { BulmaFormbuilder.new(:project, project, self, {})}
    let(:output) { builder.text_field_horizontal(:name) }

    it 'is wrapped in a div' do
      expect(output).to have_selector('div.field.is-horizontal div.field-body')
      expect(output).to have_selector('div.field.is-horizontal div.field-label')
    end

    describe '#textfield' do

      it 'has a name and id set correctly' do
        expect(output).to have_selector('input[type="text"]')
        expect(output).to have_selector('input[name="project[name]"]')
        expect(output).to have_selector('input[id="project_name"]')
      end

      it 'has a input class' do
        expect(output).to have_selector('input.input')
      end

      it 'is wrapped in a paragraph and a div' do
        expect(output).to have_selector('div.field-body div.field p.control input')
      end

    end

    describe '#label' do

      it 'has a caption' do
        expect(output).to have_selector('label', text: 'Name')
      end

      it 'has a label class' do
        expect(output).to have_selector('label.label')
      end

      it 'refers back to the input field' do
        expect(output).to have_selector('label[for="project_name"]')
      end

      it 'is wrapped in a div' do
        expect(output).to have_selector('div.field-label.is-normal label')
      end

    end

  end

end
