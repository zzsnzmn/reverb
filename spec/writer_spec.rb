require_relative "../person"
require_relative "../reader"
require_relative "../writer"
require "stringio"

# mock out stdout to verify that the method puts correctly
module Kernel
    def capture_stdout
        out = StringIO.new
        $stdout = out
        yield
        return out
    ensure
        $stdout = STDOUT
    end
end

describe "#capture_stdout" do
    it "captures std out in a string" do
        out = capture_stdout do
            puts "hello"
        end
        out.string.should eql "hello\n" 
    end
end

describe Writer do
    reader = Reader.new(["data/david.csv", "data/lindsey.csv", "data/batman.csv", "data/snoozemen.csv"])
    let (:writer) { Writer.new(reader.read) }

    david = "Sutton David male 01/18/1990 cerulean"
    lindsey = "Brockman Lindsey female 08/18/1990 blue"
    batman = "Wayne Batman male 04/07/1915 black"
    zz = "Snoozemen Zz male 01/01/1942 green"

    describe "#print" do
        it "writes a list of people" do
            out = capture_stdout do
                writer.print
            end
            out.string.should eql (david + "\n" + lindsey + "\n" + batman + "\n" + zz + "\n")
        end

        it "writes sorted by gender" do
            out = capture_stdout do
                writer.print(:gender)
            end
            out.string.should eql (lindsey + "\n" + zz + "\n" + david + "\n" + batman + "\n")
        end

        it "writes sorted by age" do
            out = capture_stdout do
                writer.print(:age)
            end
            out.string.should eql (batman + "\n" + zz + "\n" + david + "\n" + lindsey + "\n")
        end

        it "writes sorted by last name" do
            out = capture_stdout do
                writer.print(:name)
            end
            out.string.should eql (batman + "\n" + david + "\n" + zz + "\n" + lindsey + "\n")
        end

    end

    describe "#sort_by_gender" do
        let (:people) { writer.sort_by_gender }
        specify { people[0].to_s.should eql lindsey }
        specify { people[1].to_s.should eql zz }
        specify { people[2].to_s.should eql david }
        specify { people[3].to_s.should eql batman }
    end

    describe "#sort_by_age" do
        let (:people) { writer.sort_by_age }
        specify { people[0].to_s.should eql batman }
        specify { people[1].to_s.should eql zz }
        specify { people[2].to_s.should eql david }
        specify { people[3].to_s.should eql lindsey }
    end

    describe "#sort_by_last_name" do
        let (:people) { writer.sort_by_last_name }
        specify { people[0].to_s.should eql batman }
        specify { people[1].to_s.should eql david }
        specify { people[2].to_s.should eql zz }
        specify { people[3].to_s.should eql lindsey }
    end

end
