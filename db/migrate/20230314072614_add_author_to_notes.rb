class AddAuthorToNotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :notes, :author, foreign_key: { to_table: :users }
  end
end
