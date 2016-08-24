module SplitCalculator
  class CalExpense

    def initialize(params)
      @expense = Expense.find(params[:id])
      @ind_expenses = @expense.individual_expenses.pluck(:person_id,:amount)
      @avg_amt = @expense.total_amount / @ind_expenses.count
    end

    def cal_expense_amt
      get_and_pay_amt
      result = []
      for payer_amt in @payer_amt.keys
        n_amt = @payer_amt[payer_amt]
        @payee_amt.delete_if{|k,v| v == 0 }
        if(@payee_amt.keys.length != 0)
          for payee_amt in @payee_amt.keys
            n_amt = n_amt - @payee_amt[payee_amt]
            settlement_amt = n_amt >= 0 ? @payee_amt[payee_amt] : (@payee_amt[payee_amt] - (n_amt * -1))
            result << {expense_id: @expense.id, payee_id: payee_amt , payer_id: payer_amt , settlement_amt: settlement_amt }
            Settlement.new(expense_id: @expense.id, payee_id: payee_amt,payer_id: payer_amt, settlement_amt: settlement_amt).save
            @payee_amt[p] = (n_amt >= 0 ? 0 : n_amt * -1)
            break if n_amt <= 0
          end
        end
      end
      result
    end

    private

    def get_and_pay_amt
      hash = @ind_expenses.present? ? Hash[*@ind_expenses.flatten] : {}
      @payee_amt,@payer_amt = {},{}
      hash.each { |key, value|
        (value - @avg_amt) >= 0 ? @payee_amt[key] = value - @avg_amt : @payer_amt[key] = (value - @avg_amt).abs
      }
    end

  end
end

