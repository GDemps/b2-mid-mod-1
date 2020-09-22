class Hospital < ApplicationRecord
  validates_presence_of :name
  has_many :doctors
  has_many :surgeries, through: :doctors
end
