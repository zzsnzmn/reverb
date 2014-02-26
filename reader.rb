require 'CSV'
require 'date'
require_relative './person'

class Reader
    attr_accessor :people, :files
    def initialize(files)
        @files = files
    end

    def get_delimiter(file)
        begin
            f = File.open(file, 'r')
            s = f.read
        rescue
            s = file
        end
        if s.index(',')
            return ','
        elsif s.index('|')
            return '|'
        else
            return ' '
        end
    end

    def read_db
        list = self.read_file('highly_scalable_database.ssv')
        return list
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

    def read
        list = []
        @files.each do |file|
            list.concat(read_file(file))
        end
        return list
    end
end

