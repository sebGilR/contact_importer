FactoryBot.define do
  sequence :email do |n| 
    "person#{n}@example.com" 
  end
  
  factory :user do
    email
    password { "foobarss" }
    password_confirmation { "foobarss" }
  end
end
