def describe(description, &block)
  block.call
end

def it(description, &block)
  block.call
end

class Object
  def should
    ComparisonAssertion.new(self)
  end
end

class ComparisonAssertion
  def initialize(actual)
    @actual = actual
  end

  def ==(expected)
    unless @actual == expected
      raise AssertionError.new("Expected #{expected.inspect} but got #{@actual.inspect}")
    end
  end 
end
