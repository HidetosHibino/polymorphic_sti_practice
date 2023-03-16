RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  # build で関連を作った際、関連先はcreateする
  FactoryBot.use_parent_strategy = false
end