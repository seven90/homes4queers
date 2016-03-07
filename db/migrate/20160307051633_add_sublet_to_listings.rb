class AddSubletToListings < ActiveRecord::Migration
  def change
    add_column :listings, :sublet, :boolean
  end
end
