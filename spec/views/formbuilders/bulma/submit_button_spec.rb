RSpec.describe BulmaFormbuilder do

  let(:project) { FactoryGirl.build(:project) }
  let(:builder) { BulmaFormbuilder.new(:project, project, self, {})}


  describe '#submit_button_horizontal' do

    it 'has a submit button with default caption and id' do
      output = builder.submit_button_horizontal()
      expect(output).to have_selector("input[type='submit']")
      expect(output).to have_selector("input[value='Submit']")
      expect(output).to have_selector("input[id='submit-button']")
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

  end

end


#  <div class="field is-horizontal">
#   <div class="field-label"><!-- Left empty for spacing --></div>
#    <div class="field-body">
#        <div class="control">
#          <%= f.submit(type: 'submit', id: 'add-button', class: 'button is-primary') %>
#          <%= link_to('Back', projects_path, id: 'add-button', class: 'button') %>
#        </div>
#      </div>
#    </div>
#  </div>
