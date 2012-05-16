# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :life_insurance do
    broker nil
    insurer nil
    name "MyString"
    website ""
  end
end
