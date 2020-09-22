class Doctor < ApplicationRecord
  validates_presence_of :name, :specialty, :university
  belongs_to :hospital
  has_many :surgery_doctors
  has_many :surgeries, through: :surgery_doctors
end
