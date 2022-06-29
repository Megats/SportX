class ChangeUserIdParticipantNullTrue < ActiveRecord::Migration[7.0]
  def change
    change_column :participants, :user_id, :bigint, null: true
  end
end
