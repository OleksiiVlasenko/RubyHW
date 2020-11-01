class HW1_My_Arr
  def initialize
    @arr = (0..10).to_a

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
#---------------------------------
def task5
  @arr.index(@arr.first)+1.upto(@arr.index(@arr.last)-1) do |i|
      @arr[i]+=@arr.first if @arr[i] %2==0
  end
  p @arr
end
#---------------------------------
def task6
  @arr.index(@arr.first)+1.upto(@arr.index(@arr.last)-1) do |i|
      @arr[i]+=@arr.last if @arr[i] %2==0
  end
  p @arr
end
#---------------------------------
def task7
  @arr.index(@arr.first)+1.upto(@arr.index(@arr.last)-1) do |i|
      @arr[i]+=@arr.last if @arr[i] %2!=0
  end
  p @arr
end
#---------------------------------
def task8
  @arr.index(@arr.first)+1.upto(@arr.index(@arr.last)-1) do |i|
      @arr[i]+=@arr.first if @arr[i] %2!=0
  end
  p @arr
end
#---------------------------------
def task9
@arr.each {|i| print @arr[i]=@arr.min if i > 0}
end
#---------------------------------
def task10
@arr.each {|i| print @arr[i]=@arr.max if i > 0}
end
#---------------------------------
def task11
@arr.each {|i| print @arr[i]=@arr.min if i < 0}
end
#---------------------------------
def task12
@arr.each {|i| print @arr[i]=@arr.max if i < 0}
end
#---------------------------------
def task13
p @arr = @arr.unshift(@arr.pop)
end
#---------------------------------
def task14
p @arr = @arr.push(@arr.shift)
end
#---------------------------------
def arifm?
  return true if @arr.size < 2
  (@arr.first..@arr.last).step((@arr.last-@arr.first)/(@arr.size-1)).to_a == @arr
end
#---------------------------------
def task15
if arifm? == true
  p "Arifm true"
else p nil
end
end
#---------------------------------
def maxima(arr)
  arr.each_cons(3).each_with_object([]) do |three, memo|
    memo << three[1] if three[1] > three.first && three[1] > three.last
  end
  end
  def task17
    p maxima(@arr).max
  end
#---------------------------------
def minima(arr)
    arr.each_cons(3).each_with_object([]) do |three, memo|
      memo << three[1] if three[1] < three.first && three[1] < three.last
  end
end
def task18
  p minima(@arr).min
end
#---------------------------------
def task21
  num=0
  for i in 2..@arr.size-1
    if i<@arr.size
            if ((@arr[i-2]<@arr[i-1]) && !(@arr[i-1]<@arr[i]))
              num+=1;
            end
        end
    end
    if (@arr[@arr.size-2]<@arr[@arr.size-1])
      num+=1;
      p num
  end
end
#---------------------------------
def task23
for i in 1..@arr.size-1
  p @arr[i]
    end
      p "Enter R"
      r = gets.to_i
      x = (@arr[1]-r).abs
      n = 1
      for i in 2..@arr.size-1
      if x > (@arr[i]-r).abs
      x = (@arr[i]-r).abs
      n = i
  end
end
p "The most nearest element is -  #{@arr[n]} "
end
#---------------------------------
def task25
  p @arr.to_enum.with_index.reverse_each { |val, index| @arr.insert(index, 0) if val > 0 }
end
#---------------------------------
def task26
  p @arr.to_enum.with_index.reverse_each { |val, index| @arr.insert(index, 0) if val < 0 }
end
#---------------------------------
def task27
  b = []
  n = @arr.size-1
      nk = n
      k = 1
      for i in 1..n
        b[k] =  @arr[i]
        if @arr[i]>0
          nk+=1
          k+=1
          b[k]=0
        end
        k+=1
      end
      n=nk
       @arr=b
    for i in 1..n
    p "#{i} : #{@arr[i]}"
  end
end
#---------------------------------
def task28
  b = []
  n = @arr.size-1
      nk = n
      k = 1
      for i in 1..n
        b[k] =  @arr[i]
        if @arr[i]<0
          nk+=1
          k+=1
          b[k]=0
        end
        k+=1
      end
      n=nk
       @arr=b
    for i in 1..n
    p "#{i} : #{@arr[i]}"
  end
end
#---------------------------------
def task29
  arr = [1,3,66,32,3,10,8,2]
  p "Array > #{arr = [5,3,66,32,3,10,8,1]}"
  p "after #{arr.sort}"
end
#---------------------------------
def task30
  arr = [1,3,66,32,3,10,8,2]
  p "Array > #{arr = [5,3,66,32,3,10,8,1]}"
  p "after #{arr.sort {|f,l| l <=> f}}"
end
#---------------------------------
def task31
  arr = [1,3,66,32,3,10,8,2]
  p "Array > #{arr = [5,3,66,32,3,10,8,1]}"
  p "---------------------------------"
  p "index #{(0...arr.size).sort_by{ |i| arr[i] }.reverse}"
  p "val #{ arr.sort {|f,l| l <=> f}}"
end

#---------------------------------
def task32
  arr = [1,3,66,32,3,10,8,2]
  p "Array > #{arr = [5,3,66,32,3,10,8,1]}"
  p "---------------------------------"
  p "index #{(0...arr.size).sort_by{ |i| arr[i] }}"
  p "val #{ arr.sort {|f,l| f <=> l}}"
end
#---------------------------------
def task33
  p "Array > #{arr = [5,3,66,32,3,10,8,1]}"
  p "Value > #{arr.each_with_index.min} < Index"
end
#---------------------------------
def task34
  p "Array > #{arr = [5,3,66,32,3,10,8,1]}"
  p "Value > #{arr.each_with_index.max} < Index"
end
#---------------------------------
def task35
  p "Array > #{arr = [16,5,3,66,1,32,3,10,8,1]}"
  p "first-min value index > #{arr.index(arr.min)}"
end
#---------------------------------
def task36
  p "Array > #{arr = [1,5,3,66,1,32,3,10,66,8,99,1]}"
  p "first-max value index> #{arr.index(arr.max)}"
end
#---------------------------------
def task37
p "Array > #{arr = [1,5,3,66,1,32,3,10,8,1]}"
p "last-min value index > #{arr.rindex(arr.min)}"
end
#---------------------------------
def task38
p "Array > #{arr = [1,5,3,66,1,32,3,10,66,8,99,1]}"
p "last-max value index> #{arr.rindex(arr.max)}"
end
#---------------------------------
def task39
p "Array > #{arr = [1,5,3,66,1,32,3,10,66,8,99,1]}"
p "min elements indexes > #{arr.each.with_index.find_all{ |a,i| a == arr.min }.map{ |a,b| b }}"
p "min elements  values > #{c = arr.each.with_index.find_all{ |a,i| a == arr.min }.map{ |a,b| a }}"
p "min elements   count > #{c.count}"
end
#---------------------------------
def task40
p "Array > #{arr = [1,5,3,66,1,99,32,3,10,66,8,99,1]}"
p "max elements indexes > #{arr.each.with_index.find_all{ |a,i| a == arr.max }.map{ |a,b| b }}"
p "max elements  values > #{c =arr.each.with_index.find_all{ |a,i| a == arr.max }.map{ |a,b| a }}"
p "max elements   count > #{c.count}"
end
#---------------------------------
def task41
  p "Array > #{arr = [1,5,3,66,1,32,3,10,66,8,99,1]}"
  p "Min even el  > #{arr.select{|el| el%2==0}.min}"
end
#---------------------------------
def task42
  p "Array > #{arr = [5,3,66,32,3,10,78,8,99]}"
  p "Min odd el  > #{arr.select{|el| el%2!=0}.min}"
end
#---------------------------------
def task43
  p "Array > #{arr = [1,5,3,66,1,32,3,10,66,8,99,1]}"
  p "Max even el  > #{arr.select{|el| el%2==0}.max}"
end
#---------------------------------
def task44
  p "Array > #{arr = [5,3,66,32,3,10,78,8,99]}"
  p "Max odd el  > #{arr.select{|el| el%2!=0}.max}"
end
#---------------------------------
def task47
p "Array > #{arr = [1,5,3,66,1,99,32,3,10,66,8,99,1]}"
p 'interval 10..100'
p "min element values with interval> #{arr.each.with_index.find_all{ |a,i| a>10 && a <100 }.map{ |a,b| a }.min}"
end
#---------------------------------
def task48
p "Array > #{arr = [1,5,3,66,1,99,32,3,10,66,8,99,1]}"
p 'interval 10..100'
p "max element values with interval> #{arr.each.with_index.find_all{ |a,i| a>10 && a <100 }.map{ |a,b| a }.max}"
end
#---------------------------------
def task45
  p "Array > #{arr = [-1,-3,5,3,66,32,3,10,66,8,99]}"
  p "Min positive el  > #{arr.select{|el| el.positive?}.min}"
end
#---------------------------------
def task46
  p "Array > #{arr = [-99,-37,-27,5,3,66,32,3,10,78,8,99]}"
  p "Max negative el  > #{arr.select{|el| el.negative?}.max}"

end
#end of class
end
less = HW1_My_Arr.new
less.task46
