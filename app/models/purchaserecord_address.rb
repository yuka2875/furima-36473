class PurchaserecordAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :purchase_record_id, :user_id, :item_id, :price
  attr_accessor :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :token

    validates :postcode, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, :block
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid. Input only number"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end

end
