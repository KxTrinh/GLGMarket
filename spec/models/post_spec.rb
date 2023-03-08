require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'association' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
    it { should validate_numericality_of(:price).only_integer }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  end

  describe 'attachment' do
    it { is_expected.to have_many_attached(:photos) }
  end
end
