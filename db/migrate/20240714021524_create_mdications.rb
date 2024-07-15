class CreateMdications < ActiveRecord::Migration[7.0]
  def change
    create_table :mdications do |t|
      t.string :medicine_name
      t.string :description
      t.string :side_effect
      t.string :dosage
      t.timestamps
    end
  end
end
