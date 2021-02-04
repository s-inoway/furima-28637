class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :purchase_id, :token, :zip_code, :pref_id, :city, :chome, :bldg, :tel

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :zip_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :pref_id,  numericality: { other_than: 1 }
    validates :city
    validates :chome
    validates :tel, format: { with: /\A\d{11}\z/ }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(purchase_id: purchase.id, zip_code: zip_code, pref_id: pref_id, city: city, chome: chome, bldg: bldg, tel: tel)
  end
end
