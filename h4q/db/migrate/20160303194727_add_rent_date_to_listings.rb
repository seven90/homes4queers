class AddRentDateToListings < ActiveRecord::Migration
  def change
    add_column :listings, :rent_date, :date
  end
end
