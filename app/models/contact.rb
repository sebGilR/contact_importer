require 'csv'
class Contact < ApplicationRecord
  belongs_to :user
  before_save :add_cc_franchise
  
  validates_uniqueness_of :email, :scope => :user_id
  validates_presence_of :name, :email, :birth_date, :phone, :address, :cc
  validates :cc, credit_card_number: { brands: [:amex, :jcb, :diners,:mastercard, :visa ] }
  validates_datetime :birth_date

  phony_normalize :phone, default_country_code: 'COL'
  validates_plausible_phone :phone

  def add_cc_franchise
    card = CreditCardValidations::Detector.new(self.cc)
    self.cc_franchise = card.brand
  end

  def self.import(file, user_id)
    CSV.foreach(file.path, headers: true) do |row|
      contact = Contact.new(row.to_hash)
      contact.user_id = user_id

      contact.save!
    end
  end
end
