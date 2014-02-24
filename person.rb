class Person
    attr_accessor :last_name, :first_name, :gender, :favorite_color, :date_of_birth

    def initialize(last_name, first_name, gender, favorite_color, date_of_birth)
        @last_name = last_name
        @first_name = first_name
        @gender = gender
        @favorite_color = favorite_color
        @date_of_birth = date_of_birth
    end

    def to_s
        "#{last_name} #{first_name} #{gender} #{favorite_color} #{data_of_birth}"
    end

    def to_json
        "{\"last_name\": \"#{last_name}\", \"first_name\": \"#{first_name}\", \"gender\": \"#{gender}\", \"favorite_color\": \"#{favorite_color}\", \"date_of_birth\": \"#{date_of_birth}\"}"
    end
end


