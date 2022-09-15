class Choice < ApplicationRecord
  belongs_to :question, inverse_of: :choises
end
