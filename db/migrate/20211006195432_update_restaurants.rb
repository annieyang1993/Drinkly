class UpdateRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :pricing, :integer
    add_column :restaurants, :rating, :decimal
    add_column :restaurants, :number_of_ratings, :integer
    add_column :restaurants, :ready_in, :integer
    add_column :restaurants, :operating_time, :string
     

  end
end
