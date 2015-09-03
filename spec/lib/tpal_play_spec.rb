require_relative '../../lib/tpal_play'

describe TpalPlay do
  it 'return hash keys stringified and sorted by length' do
    hash = { abc: 'hello', 'another_key' => 123, 4567 => 'third' }
    expect(described_class.sort_keys(hash)).to eq ["abc", "4567", "another_key"]
  end
end

describe Foo::Bar do
  specify { expect(subject.value1).to eq 'Foo Bar' }
  specify { expect(subject.value2).to eq 'Global' }
  specify { expect(subject.value3).to eq 'Foo Bar' }
  # specify { expect(subject.value4).to eq 'Global' }
end

describe Lambda do
  before do
    $stdout = StringIO.new
    # allow(ENV).to receive(:[]).and_call_original
    # allow(ENV).to receive(:[]).with('SILENCE_LOGGING')
  end
  after { $stdout = STDOUT }

  specify { expect(described_class.new.run).to eq 'hello world' }
end

describe Child do
  specify { expect(subject.run('abc', 'xyz')).to eq ['abc', 'xyz'] }
end

describe 'equality and identity checks' do
  specify do
    s1 = ['abc', 1]
    s2 = ['abc', 1.0]
    s3 = s1
    expect(s1==s2).to eq true
    expect(s1===s2).to eq true
    expect(s1.eql?(s2)).to eq false
    expect(s1.equal?(s2)).to eq false
    
    expect(s1==s3).to eq true
    expect(s1===s3).to eq true
    expect(s1.eql?(s3)).to eq true
    expect(s1.equal?(s3)).to eq true
  end
end

describe 'string' do
  specify do
    s = 'hello '
    original_obj_id = s.object_id
    s += 'world'
    expect(s).to eq 'hello world'
    expect(s.object_id).to_not eq original_obj_id
  end

  specify do
    s = 'hello '
    original_obj_id = s.object_id
    s.concat 'world'
    expect(s).to eq 'hello world'
    expect(s.object_id).to eq original_obj_id
  end
end

describe Fibonacci do
  specify do
    expect(subject.run(10)).to eq [0,1,1,2,3,5,8,13,21,34]
  end
end

describe InjectSymbol do
  specify do
    expect(subject.run([1,2,3,4], '+')).to eq 10
    expect(subject.run([1,2,3,4], '*')).to eq 24
    expect(subject.run(['a', 'b', 'c', 'd'], '+')).to eq 'abcd'
    expect(subject.run(['a', 'b', 'c', 'd'], '<<')).to eq 'abcd'
  end
end

describe ComparableClass do
  specify do
    mary = ComparableClass.new(id: 1, first_name: 'mary', last_name: 'wong')
    cindy = ComparableClass.new(id: 2, first_name: 'cindy', last_name: 'lee')
    tony = ComparableClass.new(id: 3, first_name: 'tony', last_name: 'smith')
    expect([mary, cindy, tony].sort).to eq [cindy, mary, tony]
    expect([mary, cindy, tony].sort { |this, other| this.id <=> other.id }).to eq [mary, cindy, tony]
    expect([mary, cindy, tony].sort { |this, other| this.last_name <=> other.last_name }).to eq [cindy, tony, mary]
  end
end


