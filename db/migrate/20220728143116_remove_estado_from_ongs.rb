class RemoveEstadoFromOngs < ActiveRecord::Migration[5.2]
  def change
    remove_column :ongs, :estado, :string
  end
end
