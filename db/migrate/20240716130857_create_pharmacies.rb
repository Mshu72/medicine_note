class CreatePharmacies < ActiveRecord::Migration[7.0]
  def change
    create_table :pharmacies do |t|
      t.string :pharmacist
      t.string :pharmacy_name
      t.string :phone_number
      t.references :patient, foreign_key: true, type: :bigint
      t.timestamps
    end
  end
end
