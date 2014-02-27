require_relative '../person'

describe Person do
  before :each do
    @person = Person.new('Sutton', 'David', 'male', 'cerulean', '01/18/1990')
  end

  it 'has a last_name' do
    @person.last_name.should eql 'Sutton'
  end

  it 'has a first_name' do
    @person.first_name.should eql 'David'
  end

  it 'has a gender' do
    @person.gender.should eql 'male'
  end

  it 'has a favorite_color' do
    @person.favorite_color.should eql 'cerulean'
  end

  it 'has a date_of_birth' do
    @person.date_of_birth.should eql Date.strptime('01/18/1990', '%m/%d/%Y')
  end

  describe '#to_s' do
    let(:result) { @person.to_s }
    specify { result.should == 'Sutton David male 01/18/1990 cerulean' }
  end

  describe '#to_db_s' do
    let(:result) { @person.to_db_s }
    specify { result.should == "Sutton David male cerulean 01/18/1990\n" }
  end

  describe '#to_hash' do
    let(:result) { @person.to_hash }
    specify { result.should == { last_name: 'Sutton',
                                 first_name: 'David',
                                 gender: 'male',
                                 date_of_birth: '01/18/1990',
                                 favorite_color: 'cerulean' }
    }
  end
end
