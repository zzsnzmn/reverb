require 'optparse'
require 'ostruct'
require_relative './reader'
require_relative './writer'

class Reverb
    def self.new(args)
        sorter, files = self.parse(args)

        if files.size == 0
            exit
        end

        people = Reader.new(files).read

        case sorter
        when "gender"
			sort_by = :gender
		when "age"
			sort_by = :age
		when "name"
			sort_by = :name
		else
			sort_by = nil
		end

		writer = Writer.new(people)
		writer.print(sort_by)
    end

	def self.parse(args)
		# The options specified on the command line will be collected in *options*.
		# We set default values here.
		options = OpenStruct.new
		options.sort_by = nil

		opt_parser = OptionParser.new do |opts|
			opts.banner = "Usage: ruby reverb.rb -s [gender, age, name] <files>"

			opts.separator ""
			opts.separator "Specific options:"

			opts.on("-s", "--sort_by [SORT]", 
				"Sort by gender, age, name.") do |sort_by|
					options.sort_by = sort_by 
			end

			opts.separator ""
			opts.separator "Common options:"

			# No argument, shows at tail.  This will print an options summary.
			opts.on_tail("-h", "--help", "Show this message") do
				puts opts
				exit
			end
		end

		opt_parser.parse!(args)
		[options.sort_by, args]
	end
end 

if __FILE__ == $0 && ARGV
	Reverb.new(ARGV)
end