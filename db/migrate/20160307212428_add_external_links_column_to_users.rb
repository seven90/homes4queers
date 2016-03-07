class AddExternalLinksColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :external_links, :text
  end
end
