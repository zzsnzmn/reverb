require 'date'
require_relative './person'

class Reader
  attr_accessor :db
  def initialize(db = 'tmp.db')
    @db = db
  end

  def validate(str)
    delim = get_delimiter(str)
    values = str.split(delim)
    unless values.size != 5
      Person.new(values[0], values[1], values[2], values[3], values[4])
    end
  end

  def get_delimiter(str)
    if str.index(',')
      return ','
    elsif str.index('|')
      return '|'
    else
      return ' '
    end
  end

  def get_delimiter_from_file(file)
    begin
      f = File.open(file, 'r')
      s = f.read
    rescue
      s = file
    end
    get_delimiter(s)
  end

  def read_db
    read_file(@db)
  end

  def read_file(file)
    people = []
    delim = get_delimiter_from_file(file)
    f = File.open(file, 'r').read
    lines = f.split("\n")
    lines.each do |str|
      # this could probably validate better
      people.push(validate(str))
    end
    people
  end

  def read(files)
    list = []
    files.each do |file|
      list.concat(read_file(file))
    end
    list
  end
end
