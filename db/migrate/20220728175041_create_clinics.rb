class CreateClinics < ActiveRecord::Migration[5.2]
  def change
    create_table :clinics do |t|
      t.string :description
      t.string :email
      t.string :logo

      t.timestamps
    end
  end
end
