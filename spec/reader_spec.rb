require_relative '../person'
require_relative '../reader'
require 'db_helper'

describe Reader do

  it 'has a default database name' do
    reader = Reader.new
    reader.db.should eql 'tmp.db'
  end

  it 'sets db to a string' do
    reader = Reader.new('hello.db')
    reader.db.should eql 'hello.db'
  end

  let(:reader) { Reader.new }

  describe '#validate' do
    it 'returns a person' do
      person = reader.validate('a b male blue 01/18/1990')
      person.class.should eql Person
    end

    it 'handles spaces' do
      person = reader.validate('a b male blue 01/18/1990')
      person.class.should eql Person
    end

    it 'handles commas' do
      person = reader.validate('a, b, male, blue, 01/18/1990')
      person.class.should eql Person
    end

    it 'handles pipes' do
      person = reader.validate('a | b | male | blue | 01/18/1990')
      person.class.should eql Person
    end

    it 'retuns nil with invalid data' do
      person = reader.validate('a b')
      person.should eql nil
    end
  end

  describe '#get_delimiter_from_file' do
    it 'returns a comma if string contains a comma' do
      reader.get_delimiter(' , ').should eql ','
    end
    it 'returns a pipe if string contains a pipe' do
      reader.get_delimiter(' | ').should eql '|'
    end
    it 'returns a space if string contains space' do
      reader.get_delimiter('  ').should eql ' '
    end
  end

  describe '#get_delimiter_from_file' do
    it 'returns a comma if given a comma delinated file' do
      reader.get_delimiter_from_file('data/people_comma.csv').should eql ','
    end
    it 'returns a pipe if given a pipe delinated file' do
      reader.get_delimiter_from_file('data/people_pipe.csv').should eql '|'
    end
    it 'returns a space if given a space delinated file' do
      reader.get_delimiter_from_file('data/people_space.csv').should eql ' '
    end
  end

  describe '#read_file' do
    it 'returns a list of people from a given filename' do
      reader.read_file('data/david.csv')[0].to_s.should eql 'Sutton David male 01/18/1990 cerulean'
    end
  end

  describe '#read' do
    let(:people) { Reader.new.read(['data/david.csv', 'data/lindsey.csv']) }
    specify { people.class.should eql Array }
    specify { people[0].class.should eql Person }
    specify { people[0].to_s.should eql 'Sutton David male 01/18/1990 cerulean' }
    specify { people[1].to_s.should eql 'Brockman Lindsey female 08/18/1990 blue' }
    specify { people.size.should eql 2 }
  end

  describe '#read_db' do
    clear_db('tmp.db')
    create_tmp('tmp.db')
    let(:db) { reader.read_db }
    specify { db[0].to_s.should eql 'Sutton David male 01/18/1990 cerulean' }
  end
end
