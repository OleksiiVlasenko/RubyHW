class My_Arr
  def initialize
    @arr = (1..10).to_a

  end

def task1
  p 'even index'
  @arr.each_with_index do |val,index|
    p val if (index % 2) == 0
  end
  p 'odd index'
  @arr.each_with_index do |val,index|
    p val if (index % 2) != 0
  end
end
#---------------------------------
def task2
  even,odd = [],[]
  @arr.each_with_index do |val,index|
  if (index % 2)!=0
    odd << val
    else even << val
    end
  end
  p 'Odd index'
    odd.each {|odd| p odd}
  p 'Even index'
    even.each {|even| p even}
end
#---------------------------------


less = My_Arr.new
less.task2
