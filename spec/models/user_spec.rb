require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'tamara', email: 'tamara@test.com', password: '123456')
  end
  before { subject.save }

  describe 'check user validity' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  describe 'check user invalidity' do
    it 'is invalid with invalid name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid with invalid email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it 'is invalid with invalid password' do
      subject.password = ''
      expect(subject).to_not be_valid
    end
  end
end
