RSpec.describe BulmaFormbuilder do

  let(:project) { FactoryGirl.build(:project) }
  let(:builder) { BulmaFormbuilder.new(:project, project, self, {})}


  describe '#submit_button_horizontal' do

    it 'has a submit button with default caption and id' do
      output = builder.submit_button_horizontal()
      expect(output).to have_selector("input[type='submit']")
      expect(output).to have_selector("input[id='submit-button']")
    end

    it 'has a default caption for a new object' do
      output = builder.submit_button_horizontal()
      expect(output).to have_selector("input[value='Create Project']")
    end

    it 'has a default caption for a existing object' do
      project2 = FactoryGirl.create(:project)
      builder2 = BulmaFormbuilder.new(:project, project2, self, {})
      output = builder2.submit_button_horizontal()
      expect(output).to have_selector("input[value='Update Project']")
    end

    it 'accepts a custom title' do
      output = builder.submit_button_horizontal(caption: 'My own title')
      expect(output).to have_selector("input[value='My own title']")
    end

    it 'accepts a custom id' do
      output = builder.submit_button_horizontal(id: 'custom-id')
      expect(output).to have_selector("input[id='custom-id']")
    end

    it 'has a button primary class' do
      output = builder.submit_button_horizontal()
      expect(output).to have_selector("input.button.is-primary")
    end

    it 'is wrapped in a control-div' do
      output = builder.submit_button_horizontal()
      expect(output).to have_selector('div.control input')
    end

    it 'is wrapped in a fieldbody-div' do
      output = builder.submit_button_horizontal()
      expect(output).to have_selector('div.field-body div.control')
    end

    it 'is wrapped in a horizontal field-div' do
      output = builder.submit_button_horizontal()
      expect(output).to have_selector('div.field.is-horizontal div.field-body')
    end

    it 'has a label-div' do
      output = builder.submit_button_horizontal()
      expect(output).to have_selector('div.field.is-horizontal div.field-label')
    end

    it 'has an optional back button' do
      output = builder.submit_button_horizontal(back_url: 'url-path')
      expect(output).to have_link('Back', href: 'url-path')
    end

  end

end
