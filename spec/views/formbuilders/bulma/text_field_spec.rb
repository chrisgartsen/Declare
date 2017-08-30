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
        expect(output).to have_selector('div.field-body div.field div.control input')
      end

      it 'can be a password field' do
        output = builder.text_field_horizontal(:name, type: :password)
        expect(output).to have_selector('input[type="password"]')
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

  describe '#text_field_horizontal with errors' do

    before(:each) do
      @project = FactoryGirl.build(:project, :missing_name)
      @project.valid?
      @builder = BulmaFormbuilder.new(:project, @project, self, {})
      @output  = @builder.text_field_horizontal(:name)
    end

    it 'has an error class' do
      expect(@output).to have_selector('input.is-danger')
    end

    it 'has an error icon' do
      expect(@output).to have_selector('div.control.has-icons-right')
      expect(@output).to have_selector('span.icon.is-small.is-right')
      expect(@output).to have_selector('i.fa.fa-warning')
    end

    it 'has an error message' do
      expect(@output).to have_selector('p.help.is-danger', text: "Name can't be blank")
    end

  end

end
