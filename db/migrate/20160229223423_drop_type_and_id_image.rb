class DropTypeAndIdImage < ActiveRecord::Migration
  def change
    remove_column :images, :imageable_id, :integer
    remove_column :images, :imageable_type, :string
  end
end
