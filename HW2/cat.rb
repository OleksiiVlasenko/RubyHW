class Cat < Pet
  def initialize(name)
    super
    @life = 10
    @name = name
  end

  def say
    p "**#{name} meow meow, murf murf"
    super
  end
end
