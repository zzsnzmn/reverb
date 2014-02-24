require 'CSV'
require_relative './person'

class Printer
    attr_accessor :people, :files
    def initialize(files)
        @people = []
        @files = files
    end

    def get_delimiter(file)
    end
end

