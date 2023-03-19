module Ratable
  extend ActiveSupport::Concern

  included do
    #relation about Rate(polymorpic and sti)
    has_many :rates, as: :ratable, dependent: :destroy
    has_many :good_rates, as: :ratable, dependent: :destroy
    has_many :bad_rates, as: :ratable, dependent: :destroy
    # 下は動かない。　createするとword_id,user_idが分からないと言われる。
    # rates に対しては as: :ratableにしているので、polymorphicが働いてword_idをpolymorphicのターゲット(ratable)として解釈してくれるが、
    # good_rates, bad_ratesに対しては :ratable　としていないのでratableとして解釈できないからっぽい
    # has_many :good_rates
    # has_many :bad_rates
    has_many :rated_voters, through: :rates, source: :voter
    has_many :good_rated_voters, through: :good_rates, source: :voter
    has_many :bad_rated_voters, through: :bad_rates, source: :voter
  end
end