class Sample < Reaction
  # STI as Child
  has_many :usefuls
  validates :body, presence: true
end
