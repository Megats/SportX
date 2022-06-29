class RemoveIndexUserId < ActiveRecord::Migration[7.0]
  def change
    remove_index :donations, name: "index_donations_on_user_id"
  end
end
