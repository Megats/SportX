class RemoveIndexUserIdParticipant < ActiveRecord::Migration[7.0]
  def change
    remove_index :participants, name: "index_participants_on_user_id"
  end
end
