FactoryBot.define do
  factory :contact do
    name { "Contact name" }
    email
    birth_date { DateTime.now }
    phone { "000-000-00-00" }
    address { "Some address" }
    cc { "371449635398431" }
    cc_franchise { "American Express" }
    association :user
  end
end
