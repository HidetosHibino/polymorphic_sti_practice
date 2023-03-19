class CreateRates < ActiveRecord::Migration[7.0]
  def change
    create_table :rates do |t|
      t.references :ratable, polymorphic: true, null: false
      t.references :voter, null: false, foreign_key: { to_table: :users }
      t.string :type

      t.timestamps
    end
    add_index :rates, [:ratable_id, :ratable_type, :type, :voter_id], unique: true
  end
end
