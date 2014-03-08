# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    make "Ford"
    model "Mustang"
    year "1967"
    price "9999.99"
  end
end
