class Sorter
	def initialize people
		@people = people
	end

	def sort_by_lastname
		@people.sort { |a, b| b.last_name <=> a.last_name }
	end

	def sort_by_gender
	    @people.sort { |a, b| a.gender.downcase == b.gender.downcase ? a.last_name <=> b.last_name : a.gender <=> b.gender }
	end
	
	def sort_by_age(people)
    	@people.sort { |a, b| a.date_of_birth <=> b.date_of_birth }
	end

end