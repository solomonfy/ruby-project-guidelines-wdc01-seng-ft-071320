class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
      create_table :vehicles do |t|
        t.string :name
        t.string :make
        t.integer :year
        t.integer :milage
        t.references :drivable, polymorphic: true
        t.timestamps
      end
  end

end
