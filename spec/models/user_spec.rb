require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association' do
    it { should have_many(:posts).dependent(:destroy) }
  end

  describe 'validations' do
    subject { User.create(email: 'Test@mail.com', name: 'Kev', last_name: 'Tr', age: 23, password:'123456') }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_numericality_of(:age).only_integer }
    it { should validate_numericality_of(:age).is_greater_than(0) }
  end

  describe 'attachment' do
    it { is_expected.to have_one_attached(:avatar) }
  end
end
