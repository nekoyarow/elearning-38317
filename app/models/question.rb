class Question < ApplicationRecord
  belongs_to :learning, optional: true, inverse_of: :questions
  has_many :choices, inverse_of: :question
  accepts_nested_attributes_for :choices
end
