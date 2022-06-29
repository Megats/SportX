class DeviseAddRolesToAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :roles, :integer, default: 0
  end
end
