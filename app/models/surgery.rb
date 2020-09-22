class Surgery < ApplicationRecord
  validates_presence_of :title, :day_of_week, :operating_room_number
  has_many :surgery_doctors, dependent: :destroy
  has_many :doctors, through: :surgery_doctors

  def this_day_surgeries
    Surgery.where(day_of_week: "#{day_of_week}")
  end
end
