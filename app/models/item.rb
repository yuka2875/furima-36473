class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :item_name, presence: true
  validates :image, presence: true
  validates :explanation, presence: true


  validates :user, presence: true


  validates :category_id, :item_status_id, :delivery_cost_id, :prefecture_id, :shipping_day_id,
            numericality: { other_than: 1, message: "can't be blank" }

  with_options presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true } do  
  validates :price
  end
end
