# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :position do
    user nil
    account_unit nil
    buy_price 1.5
    sell_price 1.6
    price_paid 1356
    buy_date "2012-05-12 20:35:44"
    sell_date "2012-05-12 20:35:44"
  end
end
