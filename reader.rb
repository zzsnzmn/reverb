require 'CSV'
require 'date'
require_relative './person'

class Reader
    attr_accessor :people, :files
    def initialize(files)
        @files = files
    end

    def validate(str)
        begin
            delim = self.get_delimiter(str)
            values = str.split(delim)
            return Person.new(values[0], values[1], values[2], values[3], values[4])
        rescue
            return nil
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
        return self.get_delimiter(s)
    end

    def read_db
        list = self.read_file('highly_scalable_database.ssv')
        return list
    end

    def read_file(file)
        delim = self.get_delimiter_from_file(file)
        list = []
        CSV.foreach(file, {:col_sep => delim}) do |row|
            # this could probably validate better
            list.push(Person.new(row[0], row[1], row[2], row[3], row[4]))
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

