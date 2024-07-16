class CreateMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :medications do |t|
      t.string :medicine_name
      t.text :description
      t.string :dosage
      t.text :side_effect
      t.references :patient, foreign_key: true, type: :bigint
      t.timestamps
    end
  end
end
