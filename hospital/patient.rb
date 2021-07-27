# The old way

class Patient
  def initialize(name, cured)
    @name = name
    @cured = cured || false
  end
end

john = Patient.new('John', false)
john = Patient.new(false, 'John')
p john

# The new way
# MAKE SURE YOU USE THE NEW WAY TODAY PLEASE!!

class Patient
  attr_reader :name, :cured
  attr_accessor :id, :room  # same as a method

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
  end

  def cure
    @cured = true
  end
end

# cured has default false, no need to pass it
john = Patient.new({name: 'John'})
p john

