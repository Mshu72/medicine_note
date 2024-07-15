class CreatePrescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :prescriptions do |t|
      t.string :frequency, 
      t.string :duration,
      t.integer :patient_id
      t.integer :medication_id
      t.integer :doctor_id
      t.timestamps
    end
  end
end
