class AddActiveColumnToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :active, :boolean
  end
end
