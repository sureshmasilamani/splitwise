module Reports
  class DateRangeExpenseReport

    def initialize(params)
     @from_date = params[:from_date].db_format
     @to_date = params[:to_date].db_format
    end

    def reports
      return owners,individual_amount
    end

    def owners
      Expense.joins(:settlements)
      .where(exp_date: @from_date .. @to_date).group(:payer_id,:payee_id).select("settlements.payer_id,settlements.payee_id,sum(settlements.settlement_amt) as settlement_amt")
    end

    def individual_amount
      Expense.joins(:individual_expenses).where(exp_date: @from_date .. @to_date).group(:person_id).select("individual_expenses.person_id,sum(individual_expenses.amount) ind_amount")
    end

  end
end