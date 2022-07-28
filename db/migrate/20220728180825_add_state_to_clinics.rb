class AddStateToClinics < ActiveRecord::Migration[5.2]
  def change
    add_reference :clinics, :state, foreign_key: true
  end
end
