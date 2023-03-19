class Rate < ApplicationRecord
  # RATE_TYPE_CLASSNAMES = ['GoodRate', 'BadRate']
  # RATE_TYPE_CLASSNAMES = [['good','GoodRate'], ['bad','BadRate']]

  RATE_TYPES = ['good', 'bad']
  belongs_to :ratable, polymorphic: true
  belongs_to :voter, class_name: 'User'

  validates :voter_id,  uniqueness: { scope: [:type, :ratable_type, :ratable_id]} 
end
