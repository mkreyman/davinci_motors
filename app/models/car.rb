class Car < ActiveRecord::Base
  belongs_to :user
  validates :make, :model, :year, presence: true
  validates :price, presence: true, numericality: {
      :greater_than_or_equal_to => 0.01, :less_than => 1_000_000  }
end
