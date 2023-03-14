class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.references :notable, polymorphic: true, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
