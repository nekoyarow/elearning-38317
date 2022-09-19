class Learning < ApplicationRecord
  belongs_to :user
  has_many :questions, inverse_of: :learning, dependent: :destroy
  has_many :plays
  accepts_nested_attributes_for :questions, allow_destroy: true

  validates :title, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :comment, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

end
