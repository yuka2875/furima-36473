FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 {Faker::Internet.free_email}
    password              { '123abc' }
    password_confirmation { password }
    last_name             { '全角' }
    last_name_kana        { 'ゼンカク' }
    first_name            { '全角' }
    first_name_kana       { 'ゼンカク' }
    birth_date            { '1990-01-05' }
  end
end
