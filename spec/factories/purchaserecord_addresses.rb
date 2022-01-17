FactoryBot.define do
  factory :purchaserecord_address do
    postcode             { '123-4567' }
    prefecture_id        { 1 }
    city                 { '東京都' }
    block                { '1-1' }
    building             { '東京ハイツ' }
    phone_number         { '09000000000' }
    purchase_record_id   { 2 }
  end
end

