class RemovePasswordDigestFromAdminUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :admin_users, :password_digest, :string
  end
end
