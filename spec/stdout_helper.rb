require "stringio"

# mock out stdout to verify that the method puts correctly
module Kernel
    def capture_stdout
        out = StringIO.new
        $stdout = out
        yield
        return out
    ensure
        $stdout = STDOUT
    end
end

describe "#capture_stdout" do
    it "captures std out in a string" do
        out = capture_stdout do
            puts "hello"
        end
        out.string.should eql "hello\n" 
    end
end