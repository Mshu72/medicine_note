class CreateMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :medications do |t|
      t.string :medication_name, null: false
      t.text :description, null: false
      t.string :dosage, null: false
      t.text :side_effect, null: false
      t.references :patient, null: false, foreign_key: true
      t.timestamps
    end
  end
end
