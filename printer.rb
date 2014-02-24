require 'CSV'
require_relative './person'

class Printer
    attr_accessor :people, :files
    def initialize(files)
        @people = []
        @files = files
        self.read_files
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
            list.push(Person.new(row[0].strip, row[1].strip, row[2].strip, row[3].strip, row[4].strip))
        end
        return list
    end

    def read_files
        @files.each do |file|
            @people.concat(read_file(file))
        end
    end
end
