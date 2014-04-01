require 'spec_helper'

describe Car do

    it { should validate_presence_of(:make) }
    it { should validate_presence_of(:model) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:year) }

    it { should validate_numericality_of(:price).
                    is_greater_than(0).
                    is_less_than(1_000_000) }

    it { should belong_to(:user) }


  describe "validations" do
    it "validates price" do
      car = Car.new(make: 'Ford', model: 'Fusion', year: 2007, price: 2350.00)

      expect(car).to be_valid

      car.price = nil
      expect(car).to_not be_valid
      expect(car.errors[:price]).to be_present
    end

    it "validates value is between 0.01 and 999999.99" do
      car = Car.new(make: 'Ford', model: 'Fusion', year: 2007, price: 2350.00)

      expect(car).to be_valid

      car.price = 0.00
      expect(car).to_not be_valid
      expect(car.errors[:price]).to be_present

    end
  end
end
