class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.integer "restaurant_id"
      t.string "tag"
    end
  end
end
