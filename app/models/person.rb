class Person < ActiveRecord::Base
  has_many :settlements
  has_many :individual_expenses

  validates :name, presence: true
end
