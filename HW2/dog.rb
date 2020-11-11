class Dog < Pet

  def initialize(name)
    super
    @life = 1
  end

  def say
    p "**#{name} wuff wuff, arrr arr"
    super
  end
end