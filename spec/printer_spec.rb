require_relative "../person"
require_relative "../printer"

describe Printer do
    before :each do
        @printer = Printer.new("../data/people_comma.csv")
    end
    
    it "has a list of people" do
        @printer.people.class.should eql Array
    end

end
