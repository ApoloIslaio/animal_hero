class AddStateToOngs < ActiveRecord::Migration[5.2]
  def change
    add_reference :ongs, :state, foreign_key: true
  end
end
