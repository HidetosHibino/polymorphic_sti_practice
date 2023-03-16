class AddSimilarToReactions < ActiveRecord::Migration[7.0]
  def change
    add_reference :reactions, :similar, foreign_key: { to_table: :words }
  end
end
