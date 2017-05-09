RSpec.describe BootstrapFormbuilder do

  describe '#text_area_group' do

    let(:contact_message) { FactoryGirl.build(:contact_message) }
    let(:builder) { BootstrapFormbuilder.new(:contact_message, contact_message, self, {})}
    let(:output) { builder.text_area_group(:message) }

    describe 'text_area' do

      it 'has a textarea with the correct name' do
        expect(output).to have_selector('textarea')
        expect(output).to have_selector('textarea[name="contact_message[message]"]')
        expect(output).to have_selector('textarea[id="contact_message_message"]')
      end

      it 'has a css of class form-control' do
        expect(output).to have_selector('textarea.form-control')
      end

      it 'is wrapped in a div with a default with' do
        expect(output).to have_selector('div.col-sm-6 textarea')
      end

      it 'has a default row setting of 10' do
        expect(output).to have_selector('textarea[rows="10"]')
      end

    end

    describe 'label' do

      it 'has a caption' do
        expect(output).to have_selector('label', text: 'Message')
      end

      it 'has a ccs of class control-label and a default with' do
        expect(output).to have_selector('label.control-label')
        expect(output).to have_selector('label.col-sm-4')
      end

      it 'refers back to the text area field' do
        expect(output).to have_selector('label[for="contact_message_message"]')
      end

    end

    describe 'group' do

      it 'is wrapped in a div with a css of form-group' do
        expect(output).to have_selector('div.form-group')
      end

    end

  end

end
