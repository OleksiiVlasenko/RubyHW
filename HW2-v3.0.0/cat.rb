class Cat < Pet
  def initialize(name)
    super
    @name = name
  end

  def say
    p "**#{name} meow meow, murf murf"
    super
  end
end
