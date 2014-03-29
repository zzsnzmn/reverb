require_relative '../person'
require_relative '../sorter'

describe "Sorter" do
	let(:a) {Person.new(last_name="B", first_name="A", gender="male", favorite_color="blue", date_of_birth="01/04/1990")}
	let(:b) {Person.new(last_name="C", first_name="A", gender="female", favorite_color="blue", date_of_birth="01/03/1990")}
	let(:c) {Person.new(last_name="D", first_name="A", gender="female", favorite_color="blue", date_of_birth="01/02/1990")}
	let(:sorter) {Sorter.new([a, b, c])}

	describe "#sort_by_lastname" do
		it 'sorts by last_name' do
			sorter.sort_by_lastname.should eql [c, b, a]
		end
	end

	describe "#sort_by_gender" do
		it 'sorts by gender' do
			sorter.sort_by_gender.should eql [b, c, a]
		end
	end

	describe "#sort_by_age" do
		it "sorts by age" do
			sorter.sort_by_birthdate.should eql [c, b, a]
		end
	end
end