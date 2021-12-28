class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image

  validates :item_name, presence: true
  validates :image, presence: true, unless: :was_attached?
  validates :explanation, presence: true
  validates :price, presence: true

  validates :category_id, :item_status_id, :delivery_cost_id, :prefecture_id, :shipping_day_id,
            numericality: { other_than: 1, message: "can't be blank" }

  with_options presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
               format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' } do
    validates :price
  end

  # , format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }

  def was_attached?
    image.attached?
  end
end
