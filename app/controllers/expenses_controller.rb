class ExpensesController < ApplicationController

  def index
    @expenses = Expense.all
    respond_to do |format|
      format.html {}
      format.json {}
    end
  end

  def new
   @expense = Expense.new()
   @persons = Person.all
   flash[:error] = ""
   respond_to do |format|
     format.html {}
     format.json {}
   end
  end

  def create
    status = Expense.create_expense(expense_params)
    respond_to do |format|
      if status.present?
        #format.html { redirect_to expenses_url, notice: 'Expense was successfully created.' }
        format.html { redirect_to fetch_expenses_report_reports_url, notice: 'Expense was successfully created.' }
        format.json {}
      else
        flash[:error]= 'Expense was not created.'
        format.html { redirect_to expenses_url }
        format.json {}
      end
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def expense_params
    params.require(:expense).permit(:location, :event_id,:exp_date,:total_amount).tap do |whitelisted|
      whitelisted[:person] = params[:expense][:person] if params[:expense][:person]
    end
  end

end