class Similar < Reaction
  belongs_to :similar, class_name: 'Word'
  validates :similar_id, presence: true
end
