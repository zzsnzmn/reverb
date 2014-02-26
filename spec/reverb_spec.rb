require_relative "../reverb"
require_relative "./stdout_helper"


describe Reverb do

	it "should display help text" do
		out = capture_stdout do
			begin
				Reverb.new(["-h"])
			rescue SystemExit => e
			end
		end
		out.string.should eql "Usage: ruby reverb.rb -s [gender, age, name] <files>\n\nSpecific options:\n    -s, --sort_by [SORT]             Sort by gender, age, name.\n\nCommon options:\n    -h, --help                       Show this message\n"
	end

	it "should print by gender" do
		out = capture_stdout do
			begin
				Reverb.new(["-s", "gender", "data/people_comma.csv"])
			rescue SystemExit => e
			end
		end
		out.string.should eql "Hopper Grace Female 10/09/1906 Green\nLovelace Ada Female 10/10/1815 Orange\nMatsumoto Yukihiro Male 04/14/1965 Blue\nvan-Rossum Guido Male 01/31/1956 Red\n"
	end

	it "should print by age" do
		out = capture_stdout do
			begin
				Reverb.new(["-s", "age", "data/people_comma.csv"])
			rescue SystemExit => e
			end
		end
		out.string.should eql "Lovelace Ada Female 10/10/1815 Orange\nHopper Grace Female 10/09/1906 Green\nvan-Rossum Guido Male 01/31/1956 Red\nMatsumoto Yukihiro Male 04/14/1965 Blue\n"
	end

	it "should print by last name" do
		out = capture_stdout do
			begin
				Reverb.new(["-s", "name", "data/people_comma.csv"])
			rescue SystemExit => e
			end
		end
		out.string.should eql "van-Rossum Guido Male 01/31/1956 Red\nMatsumoto Yukihiro Male 04/14/1965 Blue\nLovelace Ada Female 10/10/1815 Orange\nHopper Grace Female 10/09/1906 Green\n"
	end

	it "should print by last name" do
		out = capture_stdout do
			begin
				Reverb.new(["-s", "name", "data/david.csv", "data/lindsey.csv"])
			rescue SystemExit => e
			end
		end
		out.string.should eql "Sutton David male 01/18/1990 cerulean\nBrockman Lindsey female 08/18/1990 blue\n"
	end
end