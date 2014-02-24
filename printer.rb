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
end

