class Division < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '本部' },
    { id: 3, name: '看護部' },
    { id: 4, name: '事務局' }
  ]

  include ActiveHash::Associations
  has_many :users
  
  end