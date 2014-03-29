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

end
