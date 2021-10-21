require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject { FactoryBot.build(:contact) }

  context 'it is valid' do
    it 'with all attributes present' do
      expect(subject).to be_valid
    end

    it 'without cc_franchise' do
      subject.cc_franchise = nil
      expect(subject).to be_valid
    end
  end

  context 'it is invalid' do
    it 'without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'without a birth date' do
      subject.birth_date = nil
      expect(subject).to_not be_valid
    end

    it 'without a phone number' do
      subject.phone = nil
      expect(subject).to_not be_valid
    end

    it 'without an address' do
      subject.address = nil
      expect(subject).to_not be_valid
    end

    it 'without a cc' do
      subject.cc = nil
      expect(subject).to_not be_valid
    end
  end
end
