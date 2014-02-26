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
        "#{last_name} #{first_name} #{gender} #{date_of_birth} #{favorite_color}"
    end

    def to_db_s
        "#{last_name} #{first_name} #{gender} #{favorite_color} #{date_of_birth}\n"
    end

    def to_json
        "{\"last_name\": \"#{last_name}\", \"first_name\": \"#{first_name}\", \"gender\": \"#{gender}\", \"date_of_birth\": \"#{date_of_birth}\", \"favorite_color\": \"#{favorite_color}\"}"
    end
end


