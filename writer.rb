class Writer
  attr_accessor :db_name

  def initialize(db='tmp.db')
    @db = db
  end

  def print(people, sort_by = nil)
    case sort_by
    when :gender
      people = sort_by_gender(people)
    when :age
      people = sort_by_age(people)
    when :name
      people = sort_by_last_name(people)
    end
    people.each do |person|
      puts person.to_s
    end
  end

  def save(person)
    File.open(@db, 'a') { |file| file.write(person.to_db_s) }
  end

  def sort_by_gender(people)
    people.sort { |a, b| a.gender.downcase == b.gender.downcase ? a.last_name <=> b.last_name : a.gender <=> b.gender }
  end

  def sort_by_age(people)
    people.sort { |a, b| a.date_of_birth <=> b.date_of_birth }
  end

  def sort_by_last_name(people)
    people.sort { |a, b| b.last_name <=> a.last_name }
  end
end
