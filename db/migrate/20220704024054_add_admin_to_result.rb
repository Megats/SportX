class AddAdminToResult < ActiveRecord::Migration[7.0]
  def change
    add_reference :results, :admin, index: true
  end
end
