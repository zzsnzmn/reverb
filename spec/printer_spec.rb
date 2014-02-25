require_relative "../person"
require_relative "../printer"

describe Printer do

    it "has a list of people" do
        @printer = Printer.new([])
        @printer.people.class.should eql Array
    end

    it "has a list of files" do
        @printer = Printer.new([])
        @printer.files.class.should eql Array
    end

    describe "#new" do
        it "sets files to a given list" do
            @printer = Printer.new(["../data/david.csv"])
            @printer.files.should eql ["../data/david.csv"]
        end
        
        it "adds people from a file" do
            @printer = Printer.new(["../data/david.csv"])
            @printer.people[0].to_s.should eql "Sutton David male 01/18/1990 cerulean"
            @printer.people.size.should eql 1
        end

        it "handles more than one file" do
            @printer = Printer.new(["../data/david.csv", "../data/lindsey.csv"])
            @printer.people[0].to_s.should eql "Sutton David male 01/18/1990 cerulean"
            @printer.people[1].to_s.should eql "Brockman Lindsey female 08/18/1990 blue"
            @printer.people.size.should eql 2
        end
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
            @printer.read_file("../data/david.csv")[0].to_s.should eql "Sutton David male 01/18/1990 cerulean"
        end
    end
    
    describe "#read_files" do
        it "returns a list of people" do
            @printer = Printer.new(["../data/david.csv", "../data/lindsey.csv"])
            @printer.people[0].to_s.should eql "Sutton David male 01/18/1990 cerulean"
            @printer.people[1].to_s.should eql "Brockman Lindsey female 08/18/1990 blue"
            @printer.people.size.should eql 2
        end
    end

    describe "#get_by_gender" do
        it "returns a list of people sorted by gender" do
            @printer = Printer.new(["../data/david.csv", "../data/lindsey.csv", "../data/batman.csv", "../data/snoozemen.csv"])
            @person2 = Person.new("Wayne", "Batman", "male", "black", "04/07/1915")
            @list = @printer.get_by_gender
            @list[0].to_s.should eql "Brockman Lindsey female 08/18/1990 blue"
            @list[1].to_s.should eql "Snoozemen Zz male 01/01/1942 green"
            @list[2].to_s.should eql "Sutton David male 01/18/1990 cerulean"
            @list[3].to_s.should eql "Wayne Batman male 04/07/1915 black"
            @list.size.should eql 4
        end
    end

    describe "#get_by_dob" do
        it "returns a list of people sorted by birthday (oldest first)" do
            @printer = Printer.new(["../data/david.csv", "../data/lindsey.csv", "../data/batman.csv", "../data/snoozemen.csv"])
            @list = @printer.get_by_dob
            @list[0].to_s.should eql "Wayne Batman male 04/07/1915 black"
            @list[1].to_s.should eql "Snoozemen Zz male 01/01/1942 green"
            @list[2].to_s.should eql "Sutton David male 01/18/1990 cerulean"
            @list[3].to_s.should eql "Brockman Lindsey female 08/18/1990 blue"
            @list.size.should eql 4
        end
    end

    describe "#get_by_name" do
        it "returns a list of people sorted by last_name Z-A" do
            @printer = Printer.new(["../data/david.csv", "../data/lindsey.csv", "../data/batman.csv"])
            @list = @printer.get_by_name
            @list[0].to_s.should eql "Wayne Batman male 04/07/1915 black"
            @list[1].to_s.should eql "Sutton David male 01/18/1990 cerulean"
            @list[2].to_s.should eql "Brockman Lindsey female 08/18/1990 blue"
            @list.size.should eql 3
        end
    end

end
