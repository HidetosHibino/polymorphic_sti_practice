class CreateReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :reactions do |t|
      t.references :word, null: false, foreign_key: true
      t.string :type
      t.string :body

      t.timestamps
    end
  end
end
