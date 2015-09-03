class TpalPlay
  def self.sort_keys(hash)
    hash.keys.map(&:to_s).sort_by(&:length)
  end
end

VAL = 'Global'

module Foo
  VAL = 'Foo Bar'

  class Bar
    def value1
      VAL
    end
  end
end

module Foo
  class Bar
    def value3
      VAL
    end
  end
end

# class Foo
#   class Bar
#     def value4
#       VAL
#     end
#   end
# end

class Foo::Bar
  def value2
    VAL
  end
end

class Lambda
  def run
    -> (a) { p a }['hello world']
  end
end

class Base
  def run(param1, param2)
    [ param1, param2 ]
  end
end

class Child < Base
  def run(param1, param2)
    super
  end
end

class Fibonacci
  def run(length)
    # (length-2).times.inject([0,1]) { |fib| fib << fib.last + fib[fib.length-2] }
    (length-2).times.inject([0,1]) { |fib| fib << fib.last(2).inject(&:+) }
  end
end

class InjectSymbol
  def run(array, operator)
    # array.inject { |sum, elem| sum = sum.public_send operator, elem }
    array.inject(&operator.intern)
  end
end

class ComparableClass
  attr_reader :id, :first_name, :last_name

  def initialize(id:, first_name:, last_name:)
    @id = id
    @first_name = first_name
    @last_name = last_name
  end

  def <=>(other)
    first_name <=> other.first_name
  end
end