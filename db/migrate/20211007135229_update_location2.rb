class UpdateLocation2 < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :latitude, :decimal, :precision=>64, :scale=>12
    add_column :locations, :longitude, :decimal, :precision=>64, :scale=>12
  end
end
