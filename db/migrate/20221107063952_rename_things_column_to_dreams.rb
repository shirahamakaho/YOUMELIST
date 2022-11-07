class RenameThingsColumnToDreams < ActiveRecord::Migration[6.1]
  def change
    rename_column :dreams, :things, :content
  end
end
