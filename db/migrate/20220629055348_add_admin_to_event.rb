class AddAdminToEvent < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :admin, index: true
  end
end
