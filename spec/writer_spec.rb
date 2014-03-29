require_relative '../person'
require_relative '../reader'
require_relative '../writer'
require_relative './stdout_helper'
require 'db_helper'

describe Writer do
  people = Reader.new.read(['data/david.csv',
                            'data/lindsey.csv',
                            'data/batman.csv',
                            'data/snoozemen.csv'])
  let(:writer) { Writer.new }

  david = 'Sutton David male 01/18/1990 cerulean'
  lindsey = 'Brockman Lindsey female 08/18/1990 blue'
  batman = 'Wayne Batman male 04/07/1915 black'
  zz = 'Snoozemen Zz male 01/01/1942 green'

  describe '#print' do
    it 'writes a list of people' do
      out = capture_stdout do
        writer.print(people)
      end
      out.string.should eql david + "\n" + lindsey + "\n" + batman + "\n" + zz + "\n"
    end

    it 'writes sorted by gender' do
      out = capture_stdout do
        writer.print(people, :gender)
      end
      out.string.should eql lindsey + "\n" + zz + "\n" + david + "\n" + batman + "\n"
    end

    it 'writes sorted by age' do
      out = capture_stdout do
        writer.print(people, :age)
      end
      out.string.should eql batman + "\n" + zz + "\n" + david + "\n" + lindsey + "\n"
    end

    it 'writes sorted by last name' do
      out = capture_stdout do
        writer.print(people, :name)
      end
      out.string.should eql batman + "\n" + david + "\n" + zz + "\n" + lindsey + "\n"
    end

  end

  describe '#save' do
    clear_db('tmp.db')
    person = Person.new('Sutton', 'David', 'male', 'cerulean', '01/18/1990')
    Writer.new.save(person)
    let(:result) { Reader.new.read_db }
    specify { result.size.should eql 1 }
    specify { result[0].to_s.should eql person.to_s }
  end
end
