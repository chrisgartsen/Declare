RSpec.describe BootstrapFormbuilder do

  describe '#submit_button_group' do

    let(:project) { FactoryGirl.build(:project) }
    let(:builder) { BootstrapFormbuilder.new(:project, project, self, {})}

    describe 'submit_button' do

      it 'has a submit button with a default caption' do
        output = builder.submit_button_group
        expect(output).to have_selector("input[type='submit']")
        expect(output).to have_selector("input[value='Submit']")
      end

      it 'accepts the caption as a parameter' do
        output = builder.submit_button_group('My own caption')
        expect(output).to have_selector("input[value='My own caption']")
      end

      it 'accepts an id as optional parameter' do
        output = builder.submit_button_group('My own caption', id: 'my-id')
        expect(output).to have_selector("input[id='my-id']")
      end

      it 'has no back button by default' do
        expect(output).not_to have_selector('a', text: 'Back')
      end

      it 'has a default markup' do
        output = builder.submit_button_group
        expect(output).to have_selector('input.btn.btn-primary')
      end

      it 'has a back button when a back-url is specified' do
        output = builder.submit_button_group('My own caption', back_url: projects_path)
        expect(output).to have_link('Back', href: projects_path)
      end

      it 'is wrapped in a group div' do
        output = builder.submit_button_group
        expect(output).to have_selector('div.form-group div.col-sm-offset-4.col-sm-8')
      end

    end


  end

end
