require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do

  before do
    @event = Fabricate(:event)
    @david = Fabricate(:person, name: "david", description: "David")
    @kumar = Fabricate(:person, name: "kumar", description: "Kumar")
    @arun = Fabricate(:person, name: "arun", description: "Arun")
  end

  describe "events data validation " do
    it "events not valid data " do
      Event.new(name: "", description:"").should_not  be_valid
    end

    it "events valid data " do
      Fabricate(:event, name: 'abcd', description: "abcd").should be_valid
    end
  end


  describe "person data validation " do
    it "person not valid data " do
      Person.new(name: "", description:"").should_not  be_valid
    end

    it "person valid data " do
      Fabricate(:person, name: 'xyz', description: "xyz").should be_valid
    end
  end


  ##### Create Expenses ######
  describe "POST #create the expenses" do

    it "Create Expenses vwith valid" do
      @expense = {location: "chennai", event_id: @event.id, exp_date: "01/01/2016", total_amount: 1200.0 , person: { @david.id =>{ amount: 100.0 }, @kumar.id =>{ amount: 300.0 }, @arun.id =>{ amount: 800.0} } }
      post :create, :expense => @expense, :format => 'html'
      flash[:notice].should eql("Expense was successfully created.")
    end

    it "Create Expenses invalid data" do
      @expense = {location: nil, event_id:nil, exp_date: nil, total_amount: 1200.0 , person: { @david.id =>{ amount: 100.0 }, @kumar.id =>{ amount: 300.0 }, @arun.id =>{ amount: 800.0} } }
      post :create, :expense => @expense, :format => 'html'
      flash[:error].should eql('Expense was not created.')
    end
  end

end
