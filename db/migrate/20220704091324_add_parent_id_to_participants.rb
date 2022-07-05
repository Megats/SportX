class AddParentIdToParticipants < ActiveRecord::Migration[7.0]
  def change
    add_column :participants, :parent_id, :bigint
  end
end
