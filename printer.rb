require 'CSV'
require_relative './person'

class Printer
    attr_accessor :people, :files
    def initialize(files)
        @people = []
        @files = files
    end

    def get_delimiter(file)
        f = File.open(file, 'r')
        s = f.read
        if s.index(',')
            return ','
        elsif s.index('|')
            return '|'
        else
            return ' '
        end
    end

    def read_file(file)
        delim = self.get_delimiter(file)
        list = []
        CSV.foreach(file, {:col_sep => delim}) do |row|
            # this could probably validate better
            list.push(Person.new(row[0], row[1], row[2], row[3], row[4]))
        end
        return list
    end
end

