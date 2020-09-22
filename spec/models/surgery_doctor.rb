require 'rails_helper'

RSpec.describe SurgeryDoctor, type: :model do
  describe "relationships" do
    it { should belong_to :doctor }
    it { should belong_to :surgery }
  end

end
