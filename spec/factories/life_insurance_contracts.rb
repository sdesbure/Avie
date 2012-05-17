# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :life_insurance_contract do
    life_insurance nil
    user nil
    contract_number "MyString"
  end
end
