class Question < ApplicationRecord
  belongs_to :learning, optional: true, inverse_of: :questions
end
