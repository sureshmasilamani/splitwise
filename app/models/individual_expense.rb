class IndividualExpense < ActiveRecord::Base
  belongs_to :expense
  belongs_to :person

  validates :expense, presence: true
  validates :person_id, presence: true
  validates :amount, presence: true
end
