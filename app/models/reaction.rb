class Reaction < ApplicationRecord
  # STIは参照を持たなくてもよい。（中間テーブルまたは他テーブルからの参照でもよい)
  # STI as Parent
  belongs_to :word
  validates :body, presence: true
end
