class Company < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '株式会社●●ホールディングス' },
    { id: 3, name: '株式会社▲▲' },
    { id: 4, name: '株式会社■■' },
    { id: 5, name: '株式会社◆◆' }
  ]

  include ActiveHash::Associations
  has_many :users

  end