class ReportsController < ApplicationController
  before_action :set_params
  def date_range
    respond_to do |format|
        format.html { }
        format.js { }
        format.json {}
     end
  end

  def fetch_expenses_report
    report = Reports::DateRangeExpenseReport.new(params)
    @owners,@individuals = report.reports
    respond_to do |format|
      format.html { }
      format.js { }
      format.json {}
    end
  end

  def set_params
    if params[:from_date].present? && params[:to_date].present?
      params[:from_date].db_format
      params[:to_date].db_format
    else
      params[:from_date] = Expense.last.try(:exp_date).to_date
      params[:to_date] = Expense.first.try(:exp_date).to_date
    end

  end

end