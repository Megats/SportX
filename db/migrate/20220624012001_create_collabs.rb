class CreateCollabs < ActiveRecord::Migration[7.0]
  def change
    create_table :collabs do |t|
      t.string :collab_name
      t.string :collab_organiser
      t.string :collab_contact
      t.string :collab_email
      t.string :collab_website

      t.timestamps
    end
  end
end
