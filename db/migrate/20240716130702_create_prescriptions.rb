class CreatePrescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :prescriptions do |t|
      t.string :frequency 
      t.string :duration
      t.references :patient, foreign_key: true, type: :bigint
      t.references :medication, foreign_key: true, type: :bigint
      t.timestamps
    end
  end
end
