class Note < ApplicationRecord
  belongs_to :notable, polymorphic: true
  validates :body, presence: :true

  def note_title
    raise NotImplementedError
  end
end
