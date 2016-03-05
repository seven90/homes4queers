class AddBasementToListings < ActiveRecord::Migration
  def change
    add_column :listings, :basement, :boolean
  end
end
