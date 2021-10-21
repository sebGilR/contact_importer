FactoryBot.define do
  factory :contact do
    name { "Contact name" }
    email
    birth_date { DateTime.now }
    phone { "3226710001" }
    address { "Some address" }
    cc { CreditCardValidations::Factory.random(:amex) }
    cc_franchise { "American Express" }
    association :user
  end
end
