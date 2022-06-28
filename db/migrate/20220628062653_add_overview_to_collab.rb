class AddOverviewToCollab < ActiveRecord::Migration[7.0]
  def change
    add_column :collabs, :Overview, :text
  end
end
