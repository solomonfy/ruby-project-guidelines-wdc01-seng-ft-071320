class AddPriceColumnToVehicles < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :price, :INTEGER
  end
end
