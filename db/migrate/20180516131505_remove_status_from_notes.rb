class RemoveStatusFromNotes < ActiveRecord::Migration[5.1]
  def change
    remove_column :notes, :status, :string
  end
end
