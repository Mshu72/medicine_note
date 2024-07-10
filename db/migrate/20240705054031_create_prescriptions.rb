class CreatePrescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :prescriptions do |t|
      t.references :medication, null: false, foreign_key: true
      t.datetime :prescribed_at
      t.integer :frequency
      t.integer :duration
      t.references :patients, null: false, foreign_key: true

      t.timestamps
    end
  end
end
