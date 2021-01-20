class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :carriage
  belongs_to :pref
  belongs_to :ship_date
  has_one_attached :image

  with_options presence: true do
    validates :user_id
    validates :image
    validates :name
    validates :comment
    validates :category_id,  numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :carriage_id,  numericality: { other_than: 1 }
    validates :pref_id,      numericality: { other_than: 1 }
    validates :ship_date_id, numericality: { other_than: 1 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000 }, format: { with: /\A[0-9]+\z/ }
  end
end
