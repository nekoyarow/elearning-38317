class Choice < ApplicationRecord
  belongs_to :question, optional: true, inverse_of: :choices
end
