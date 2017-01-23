class RemoveAdminFlgFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :admin_flg
  end
end
