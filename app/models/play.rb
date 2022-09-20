class Play < ApplicationRecord
  belongs_to :user
  belongs_to :learning
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true
end
