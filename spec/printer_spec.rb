require_relative "../person"
require_relative "../printer"

describe Printer do

    describe "#new" do
    end

    describe "#get_delimiter" do
        it "should return a comma if given a comma delinated file" do
            @printer = Printer.new([])
            @printer.get_delimiter("../data/people_comma.csv").should eql ','
        end
    end
 
    it "has a list of people" do
        @printer = Printer.new([])
        @printer.people.class.should eql Array
    end

    it "has a list of files" do
        @printer = Printer.new([])
        @printer.files.class.should eql Array
    end
    
end
