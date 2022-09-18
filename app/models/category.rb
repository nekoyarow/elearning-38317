class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '一般常識' },
    { id: 3, name: 'ビジネスマナー' },
    { id: 4, name: 'IT' },
    { id: 5, name: '看護' }
  ]

  include ActiveHash::Associations
  has_many :learnings

  end