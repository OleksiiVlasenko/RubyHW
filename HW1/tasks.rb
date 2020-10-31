class HW1_My_Arr
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
def task3
  j = nil
  @arr.size.times {|i| j=i if (@arr[i] > @arr.first && @arr[i] <@arr.last)}
      if j == nil
         p "[]"
      else p j
    end
  end

#---------------------------------
def task4
  j = nil
  @arr.size.times {|i| j=i if (@arr[i] > @arr.last && @arr[i] <@arr.first)}
      if j == nil
         p "[]"
      else p j
    end
  end

def task5
  @arr.index(@arr.first)+1.upto(@arr.index(@arr.last)-1) do |i|
      @arr[i]+=@arr.first if @arr[i] %2==0
  end
  p @arr
end

def task6
  @arr.index(@arr.first)+1.upto(@arr.index(@arr.last)-1) do |i|
      @arr[i]+=@arr.last if @arr[i] %2==0
  end
  p @arr
end

def task7
  @arr.index(@arr.first)+1.upto(@arr.index(@arr.last)-1) do |i|
      @arr[i]+=@arr.last if @arr[i] %2!=0
  end
  p @arr
end

def task8
  @arr.index(@arr.first)+1.upto(@arr.index(@arr.last)-1) do |i|
      @arr[i]+=@arr.first if @arr[i] %2!=0
  end
  p @arr
end

def task9
@arr.each {|i| print @arr[i]=@arr.min if i > 0}
end

def task10
@arr.each {|i| print @arr[i]=@arr.max if i > 0}
end

#end of class
end
less = HW1_My_Arr.new
less.task10
