class Note < ApplicationRecord
  belongs_to :notable, polymorphic: true
  validates :body, presence: :true
  belongs_to :author, class_name: 'User'

  def note_title
    raise NotImplementedError
  end
end
