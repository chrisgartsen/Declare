require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe '#application_name' do

    it 'returns the name of the application' do
      expect(helper.application_name).to eq("Declare!")
    end

  end

  describe '#application_version' do

    it 'returns the application version' do
      expect(helper.application_version).to eq('0.1.0')
    end

  end

end
