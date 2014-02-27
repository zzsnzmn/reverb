class Person
  attr_accessor :last_name, :first_name, :gender, :favorite_color, :date_of_birth

  def initialize(last_name, first_name, gender, favorite_color, date_of_birth)
    @last_name = last_name.strip
    @first_name = first_name.strip
    @gender = gender.strip
    @favorite_color = favorite_color.strip
    @date_of_birth = Date.strptime(date_of_birth.strip, '%m/%d/%Y')
  end

  def to_s
    "#{last_name} #{first_name} #{gender} #{date_of_birth.strftime('%m/%d/%Y')} #{favorite_color}"
  end

  def to_db_s
    "#{last_name} #{first_name} #{gender} #{favorite_color} #{date_of_birth.strftime("%m/%d/%Y")}\n"
  end

  def to_hash
    { last_name: @last_name,
      first_name: @first_name,
      gender: @gender,
      date_of_birth: date_of_birth.strftime('%m/%d/%Y'),
      favorite_color: @favorite_color }
  end
end


