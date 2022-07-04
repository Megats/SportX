class AddAdminToCollab < ActiveRecord::Migration[7.0]
  def change
    add_reference :collabs, :admin, index: true
  end
end
