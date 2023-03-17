class CreateUsefuls < ActiveRecord::Migration[7.0]
  def change
    create_table :usefuls do |t|
      # t.references :sample, null: false, foreign_key: true
      # 上記で　Useful.create(user: User.first, sample: Sample.first)　を実行すると
      # no such table: main.samples (ActiveRecord::StatementInvalid)　エラーで作成できない
      # samplesテーブルは存在しないため。 reactionsテーブルに対しての外部キーにする
      # コンソールで以下を実行すると、sample でなくても、sample_id に入れられてしまう。(sample_id にあたる部分 '2' は適宜変更)
      # SQL ="INSERT INTO usefuls (\"sample_id\", \"user_id\", \"created_at\", \"updated_at\") VALUES (\"2\", \"1\", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)"
      # ActiveRecord::Base.connection.execute(SQL)
      t.references :sample, null: false, foreign_key: { to_table: :reactions }
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
