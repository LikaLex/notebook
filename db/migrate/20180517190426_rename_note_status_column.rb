class RenameNoteStatusColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :notes, :status_id, :status
    drop_table :statuses
  end
end
