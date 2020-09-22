require 'rails_helper'

RSpec.describe 'As a visitor' do
  before :each do
    @sg = Hospital.create!(name:"Seattle Grace")
    @sn = Hospital.create!(name:"Seattle North")
    @tom = @sg.doctors.create!(name:"Tom", specialty:"Ortho", university: "Auburn")
    @jake = @sg.doctors.create!(name:"Jake", specialty:"Mental Health", university: "Washington")
    @cindy = @sn.doctors.create!(name:"Cindy", specialty:"Cardiovascular", university: "USC")
    @jane = @sn.doctors.create!(name:"Jane", specialty:"Emergency", university: "Ohio State")
    @meg = @sg.doctors.create!(name:"Meg", specialty:"Emergency", university: "Cal")
    @surgery1 = @tom.surgeries.create!(title:"Emergency Vasectormy", day_of_week: "Monday", operating_room_number: 101)
    @surgery2 = @tom.surgeries.create!(title:"Knee Scope", day_of_week: "Tuesday", operating_room_number: 102)
    @surgery3 = @cindy.surgeries.create!(title:"Heart Surgery", day_of_week: "Monday", operating_room_number: 101)
    SurgeryDoctor.create!(surgery_id: @surgery1.id, doctor_id: @meg.id)
  end
  it "" do
    visit "/surgeries"

    click_link "#{@surgery1.title}"

    expect(current_path).to eq("/surgeries/#{@surgery1.id}")

    within "dow_surgeries" do
      expect(section).to have_content(@surgery3.title)
    end
  end
end
