class Station < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '柏ステーション' },
    { id: 3, name: '松戸ステーション' },
    { id: 4, name: '千葉ステーション' },
    { id: 5, name: '成田ステーション' },
    { id: 6, name: '流山ステーション' }
  ]

  include ActiveHash::Associations
  has_many :users
  
  end