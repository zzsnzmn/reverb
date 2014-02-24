require_relative "../person"
require_relative "../printer"

describe Printer do

    describe "#new" do
    end

    describe "#get_delimiter" do
        it "returns a comma if given a comma delinated file" do
            @printer = Printer.new([])
            @printer.get_delimiter("../data/people_comma.csv").should eql ','
        end
        it "returns a pipe if given a pipe delinated file" do
            @printer = Printer.new([])
            @printer.get_delimiter("../data/people_pipe.csv").should eql '|'
        end
        it "returns a space if given a space delinated file" do
            @printer = Printer.new([])
            @printer.get_delimiter("../data/people_space.csv").should eql ' '
        end
    end

    describe "#read_file" do
        it "adds Person objects from a given filename" do
            @printer = Printer.new([])
            @person = Person.new("Sutton", "David", "male", "cerulean", "01/18/1990")
            @printer.read_file("../data/david.csv")[0].to_s.should eql @person.to_s
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
