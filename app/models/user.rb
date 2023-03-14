class User < ApplicationRecord
  include Notable

  def note_title
    "#{first_name} #{last_name}"
  end
end
