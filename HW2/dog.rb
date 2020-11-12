class Dog < Pet
  def initialize(name)
    super
    @name = name
  end

  def say
    p "**#{name} wuff wuff, arrr arr"
    super
  end
end