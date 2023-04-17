require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
    it { should validate_presence_of(:user_name) }
    it { should validate_uniqueness_of(:user_name).case_insensitive }
  end
end
