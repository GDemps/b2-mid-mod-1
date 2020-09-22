class CreateSurgeryDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :surgery_doctors do |t|
      t.references :surgery, foreign_key: true
      t.references :doctor, foreign_key: true
    end
  end
end
