class Expense < ActiveRecord::Base
  belongs_to :event
  has_many :individual_expenses
  has_many :settlements

  validates :location, presence: true
  validates :total_amount, presence: true
  validates :exp_date, presence: true
  validates :event_id, presence: true

  def self.create_expense(params)
    @individual_expense = []
    begin
    status = self.transaction do
      expense = self.new(location: params[:location], event_id: params[:event_id], total_amount: params[:total_amount], exp_date: params[:exp_date].db_format)
      params[:person].each do |inv_expense|
        @individual_expense << expense.individual_expenses.build(person_id: inv_expense.first, amount: inv_expense.last[:amount])
      end
      expense.individual_expenses << @individual_expense
      expense.save
      settlements = SplitCalculator::CalExpense.new(expense)
      settlements.cal_expense_amt
    end
    status
    rescue StandardError => e
    status = false
    end
  end
end