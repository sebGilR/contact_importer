require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject { FactoryBot.build(:contact) }
  let(:user) { FactoryBot.create(:user) }
  let(:csv_file) { fixture_file_upload('contacts.csv', 'csv') }
  let(:csv_duplicate_email) { fixture_file_upload('duplicated_email.csv', 'csv') }

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

    it 'without a valid phone number' do
      subject.phone = '333'
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

    it 'with an incorrectly formatted cc' do
      subject.cc = '000'
      expect(subject).to_not be_valid
    end
  end

  
  describe '#import' do
    context 'when importing a valid contact CSV' do
      it 'creates new Contacts based on CSV data' do
        initial_contacts = Contact.all.size
        described_class.import(csv_file, user.id)
        expect(Contact.all.size > initial_contacts).to eq(true)
      end
    end

    context 'CSV invalid when' do
      it 'has duplicate email addresses' do
        def run_import
          described_class.import(csv_duplicate_email, user.id)
        end
        expect { run_import }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

end
