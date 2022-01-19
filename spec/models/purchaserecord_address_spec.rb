require 'rails_helper'

RSpec.describe PurchaserecordAddress, type: :model do
  describe '購入機能の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_record_address = FactoryBot.build(:purchaserecord_address, item_id: item.id, user_id: user.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_record_address).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @purchase_record_address.building = ''
        expect(@purchase_record_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postcodeが空だと保存できないこと' do
        @purchase_record_address.postcode = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'postcodeが半角のハイフンを含んだ正しい形式(3桁ハイフン4桁)でないと保存できないこと' do
        @purchase_record_address.postcode = '1234567'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end

      it 'prefectureを選択していないと保存できないこと' do
        @purchase_record_address.prefecture_id = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @purchase_record_address.city = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空だと保存できないこと' do
        @purchase_record_address.block = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @purchase_record_address.phone_number = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10桁以上11桁以内であること' do
        @purchase_record_address.phone_number = '090000000'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end

      it 'phone_numberが11桁以上では登録できないこと' do
        @purchase_record_address.phone_number = '090000000000'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end

      it 'phone_numberが半角数値のみであること' do
        @purchase_record_address.phone_number = '090-0000-0000'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
    end
  end
end
