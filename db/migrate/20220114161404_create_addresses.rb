class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postcode,   null: false
      t.integer    :prefecture_id,    null: false
      t.string     :city
      t.string     :block
      t.string     :building
      t.string     :phone_number
      t.references :purchase_record,      null: false, foreign_key: true


      t.timestamps
    end
  end
end
