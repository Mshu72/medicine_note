class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :patient_name, null: false
      t.references :user, null: false, foreign_key: true
      t.date :birthdate, null: false
      t.string :gender, null: false
      t.timestamps
    end
  end
end
