require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe '#application_name' do

    it 'returns the name of the application' do
      expect(helper.application_name).to eq("Declare!")
    end

  end

end
