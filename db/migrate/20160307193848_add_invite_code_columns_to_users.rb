class AddInviteCodeColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :invite_code, :string
    add_column :users, :invite_code_user_id, :integer
  end
end
