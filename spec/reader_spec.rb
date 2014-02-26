require_relative "../person"
require_relative "../reader"

describe Reader do

    it "has a list of files" do
        reader = Reader.new([])
        reader.files.class.should eql Array
    end

    describe "#new" do
        it "sets files to a given list" do
            reader = Reader.new(["data/david.csv"])
            reader.files.should eql ["data/david.csv"]
        end
    end

    let(:reader) { Reader.new([]) }
    describe "#get_delimiter" do
        it "returns a comma if given a comma delinated file" do
            reader.get_delimiter("data/people_comma.csv").should eql ','
        end
        it "returns a pipe if given a pipe delinated file" do
            reader.get_delimiter("data/people_pipe.csv").should eql '|'
        end
        it "returns a space if given a space delinated file" do
            reader.get_delimiter("data/people_space.csv").should eql ' '
        end
    end

    describe "#read_file" do
        it "adds Person objects from a given filename" do
            reader.read_file("data/david.csv")[0].to_s.should eql "Sutton David male 01/18/1990 cerulean"
        end
    end
    
    describe "#read" do
        let (:people) { Reader.new(["data/david.csv", "data/lindsey.csv"]).read }
        specify { people.class.should eql Array }
        specify { people[0].class.should eql Person }
        specify { people[0].to_s.should eql "Sutton David male 01/18/1990 cerulean" }
        specify { people[1].to_s.should eql "Brockman Lindsey female 08/18/1990 blue" }
        specify { people.size.should eql 2 }
    end
end
