class Contact < ApplicationRecord
  belongs_to :user
  
  validates_presence_of :name, :email, :birth_date, :phone, :address, :cc
end
