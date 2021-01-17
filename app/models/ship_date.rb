class ShipDate < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 1, name: '1~2日で発送' },
    { id: 1, name: '3~4日で発送' },
    { id: 1, name: '5~7日で発送' },
  ]

  include ActiveHash::Associations
  has_many :articles
end
