class Writer
	attr_accessor :people

	def initialize people
		@people = people
	end

	def print
		@people.each do |person|
			puts person.to_s
		end
	end

    def sort_by_gender
        return @people.sort { |a, b| (a.gender.downcase == b.gender.downcase) ? a.last_name <=> b.last_name : a.gender <=> b.gender }
    end

    def sort_by_age
        return @people.sort { |a, b|
            Date.strptime(a.date_of_birth, '%m/%d/%Y') <=> Date.strptime(b.date_of_birth, '%m/%d/%Y') 
        }
    end

    def sort_by_last_name
        return @people.sort { |a, b| b.last_name <=> a.last_name }
    end

end