class AddColumnsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :bedrooms, :integer
    add_column :listings, :roomates, :boolean
  end
end
