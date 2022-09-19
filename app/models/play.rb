class Play < ApplicationRecord
  belongs_to :user
  belongs_to :learning
  has_many :answers
  accepts_nested_attributes_for :answers
end
