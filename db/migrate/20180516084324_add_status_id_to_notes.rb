class AddStatusIdToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :status_id, :integer
  end
end
