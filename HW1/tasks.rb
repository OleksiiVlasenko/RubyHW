class HW1_My_Arr
  def initialize
    @arr = (1..10).to_a
    @arr_rnd = Array.new(10) { rand(-10..10) }
  end

def task1
  p 'Дан целочисленный массив. Необходимо вывести вначале его элементы с четными индексами, а затем - с нечетными.'
  p "Array : #{@arr}"
  print 'Even index :'
  @arr.each_with_index{|val,index| print " #{val} " if (index % 2) == 0}
  print 'Odd index :'
  @arr.each_with_index{|val,index| print " #{val} " if (index % 2) != 0}
  p '------------------------------------------------'
end

def task2
  p 'Дан целочисленный массив. Необходимо вывести вначале его элементы с нечетными индексами, а затем - четными.'
  p "Array : #{@arr}"
  even,odd = [],[]
  @arr.each_with_index{|val,index| (index % 2)!=0 ? odd << val : even << val}
  print 'Odd index'
    odd.each {|odd| print " #{odd} "}
  print 'Even index'
    even.each {|even| print " #{even} "}
    p '------------------------------------------------'
end

def task3
  p 'Дан целочисленный массив. Вывести номер первого из тех его элементов, которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ]. '
  p "Array : #{@arr}"
  j = nil
  @arr.size.times {|i| j=i if (@arr[i] > @arr.first && @arr[i] <@arr.last)}
      if j == nil
         p "[]"
      else p "Result #{j}"
    end
    p '------------------------------------------------'
  end

def task4
  p 'Дан целочисленный массив. Вывести номер последнего из тех его элементов, которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ].'
  p "Array : #{@arr}"
  j = nil
  @arr.size.times {|i| j=i if (@arr[i] > @arr.last && @arr[i] <@arr.first)}
      if j == nil
         p "Result []"
      else "Result #{j}"
    end
    p '------------------------------------------------'
  end

def task5
  p 'Дан целочисленный массив. Преобразовать его, прибавив к четным числам первый элемент. Первый и последний элементы массива не изменять.'
  p "Array : #{@arr}"
  @arr.index(@arr.first)+1.upto(@arr.index(@arr.last)-1){|i|@arr[i]+=@arr.first if @arr[i] %2==0}
  p "Result #{@arr}"
  p '------------------------------------------------'
end

def task6
  p 'Дан целочисленный массив. Преобразовать его, прибавив к четным числам последний элемент. Первый и последний элементы массива не изменять.'
  p "Array : #{@arr}"
  @arr.index(@arr.first)+1.upto(@arr.index(@arr.last)-1){|i|@arr[i]+=@arr.last if @arr[i] %2==0}
  p "Result #{@arr}"
  p '------------------------------------------------'
end

def task7
  p 'Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам последний элемент. Первый и последний элементы массива не изменять.'
  p "Array : #{@arr}"
  @arr.index(@arr.first)+1.upto(@arr.index(@arr.last)-1){|i|@arr[i]+=@arr.last if @arr[i] %2!=0}
  p "Result #{@arr}"
  p '------------------------------------------------'
end

def task8
  p 'Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам первый элемент. Первый и последний элементы массива не изменять.'
  p "Array : #{@arr}"
  @arr.index(@arr.first)+1.upto(@arr.index(@arr.last)-1){|i|@arr[i]+=@arr.first if @arr[i] %2!=0}
  p "Result #{@arr}"
  p '------------------------------------------------'
end

def task9
  p 'Дан целочисленный массив. Заменить все положительные элементы на значение минимального.'
  p "Array : #{@arr}"
  p 'Result'
  @arr.each {|i| print " #{@arr[i]=@arr.min}," if i > 0}
  p '------------------------------------------------'
end

def task10
  p 'Дан целочисленный массив. Заменить все положительные элементы на значение максимального.'
  p "Array : #{@arr}"
  p 'Result'
  @arr.each {|i| print "#{@arr[i]=@arr.max}," if i > 0}
  p '------------------------------------------------'
end

def task11
  p 'Дан целочисленный массив. Заменить все отрицательные элементы на значение минимального.'
  p " Array : #{@arr_rnd}"
  p 'Result'
  @arr_rnd.each {|i| print "#{@arr_rnd[i]=@arr_rnd.min}," if i < 0}
  p '------------------------------------------------'
end

def task12
  p 'Дан целочисленный массив. Заменить все отрицательные элементы на значение максимального.'
  p " Array : #{@arr_rnd}"
  p 'Result'
  @arr_rnd.each {|i| print "#{@arr_rnd[i]=@arr_rnd.max}," if i < 0}
  p '------------------------------------------------'
end

def task13
  p 'Дан целочисленный массив. Осуществить циклический сдвиг элементов массива влево на одну позицию.'
  p "Array : #{@arr}"
  print ' Result '
  p @arr = @arr.unshift(@arr.pop)
  p '------------------------------------------------'
end

def task14
  p 'Дан целочисленный массив. Осуществить циклический сдвиг элементов массива вправо на одну позицию.'
  p "Array : #{@arr}"
  print ' Result '
  p @arr = @arr.push(@arr.shift)
  p '------------------------------------------------'
end

def arifm?
  return true if @arr.size < 2
  (@arr.first..@arr.last).step((@arr.last-@arr.first)/(@arr.size-1)).to_a == @arr
end

def task15
  p 'Дан целочисленный массив. Проверить, образуют ли элементы арифметическую прогрессию. Если да, то вывести разность прогрессии, если нет - вывести nil'
  p "Array : #{@arr}"
  print ' Result '
    if arifm? == true
      p "Arifm true"
      else p nil
    end
    p '------------------------------------------------'
end

def task17
  p 'Дан целочисленный массив. Найти количество его локальных максимумов.'
  p " Array : #{@arr_rnd}"
  print ' Result '
  maxima = []
  @arr_rnd.each_index do|i|
    if i != 0 && i != @arr.length - 1
    maxima <<(@arr_rnd[i]) if @arr_rnd[i - 1] < @arr_rnd[i] && @arr_rnd[i] > @arr_rnd[i + 1]
      end
    end
  p maxima.size
  p '------------------------------------------------'
end

def task18
  p 'Дан целочисленный массив. Найти количество его локальных минимумов.'
  p " Array : #{@arr_rnd}"
  print ' Result '
  minima = []
  @arr_rnd.each_index do|i|
    if i != 0 && i != @arr.length - 1
    minima <<(@arr_rnd[i]) if @arr_rnd[i - 1] > @arr_rnd[i] && @arr_rnd[i] < @arr_rnd[i + 1]
      end
    end
  p minima.size
  p '------------------------------------------------'
end

def task19
  p 'Дан целочисленный массив. Найти максимальный из его локальных максимумов.'
  p " Array : #{@arr_rnd}"
  print ' Result '
  maxima = []
  @arr_rnd.each_index do|i|
    if i != 0 && i != @arr.length - 1
    maxima <<(@arr_rnd[i]) if @arr_rnd[i - 1] < @arr_rnd[i] && @arr_rnd[i] > @arr_rnd[i + 1]
      end
    end
  p maxima.max
  p '------------------------------------------------'
end

def task20
  p 'Дан целочисленный массив. Найти минимальный из его локальных минимумов.'
  p " Array : #{@arr_rnd}"
  print ' Result '
  minima = []
  @arr_rnd.each_index do|i|
    if i != 0 && i != @arr.length - 1
    minima <<(@arr_rnd[i]) if @arr_rnd[i - 1] > @arr_rnd[i] && @arr_rnd[i] < @arr_rnd[i + 1]
      end
    end
  p minima.min
  p '------------------------------------------------'
end

def task21
  p 'Дан целочисленный массив. Определить количество участков, на которых его элементы монотонно возрастают.'
  p "Array : #{@arr}"
  print ' Result '
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
  p '------------------------------------------------'
end

def task23
  p 'Дано вещественное число R и массив вещественных чисел. Найти элемент массива, который наиболее близок к данному числу.'
  arr_r = Array.new(10) { rand(-10.2..10.2) }
  p "Array : #{arr_r}"
  p "R : #{r = 2.3}"
  for i in 1..arr_r.size-1
        x = (arr_r[1]-r).abs
        n = 1
        for i in 2..arr_r.size-1
        if x > (arr_r[i]-r).abs
        x = (arr_r[i]-r).abs
        n = i
        end
      end
    end
    p " Result - #{arr_r[n]} "
    p '------------------------------------------------'
end

def task24
  p 'Дано вещественное число R и массив вещественных чисел. Найти элемент массива, который наименее близок к данному числу.'
  arr_r = Array.new(10) { rand(-10.2..10.2) }
  p "Array : #{arr_r}"
  p "R : #{r = 2.3}"
  for i in 1..arr_r.size-1
        x = (arr_r[1]-r).abs
        n = 1
        for i in 2..arr_r.size-1
        if x < (arr_r[i]-r).abs
        x = (arr_r[i]-r).abs
        n = i
        end
      end
    end
    p " Result - #{arr_r[n]} "
    p '------------------------------------------------'
end

def task25
  p 'Дан целочисленный массив. Преобразовать его, вставив перед каждым положительным элементом нулевой элемент.'
  p "Array : #{@arr}"
  print ' Result '
  y = []
  b = 0
  for i in 0..@arr.size-1
    if @arr[i] > 0
    y[b] = @arr[i]
    y[b - 1] = 0
    b+=2
    else
    y[b] = @arr[i]
    b+=1
    end
  end
  for i in 0..b
     print " #{y[i]}"
end
  p '------------------------------------------'
end

def task26
  # p 'Дан целочисленный массив. Преобразовать его, вставив перед каждым отрицательным элементом нулевой элемент.'
  # p " Array : #{@arr_rnd}"
  # print ' Result '
  # p @arr.to_enum.with_index.reverse_each { |val, index| @arr.insert(index, 0) if val < 0 }
  # p '------------------------------------------'
end

def task27
  p 'Дан целочисленный массив. Преобразовать его, вставив после каждого положительного элемента нулевой элемент.'
  p "Array : #{@arr}"
  p ' Result '
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
    p '------------------------------------------'
end

def task28
  p 'Дан целочисленный массив. Преобразовать его, вставив после каждого отрицательного элемента нулевой элемент.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  b = []
  n = @arr_rnd.size-1
      nk = n
      k = 1
      for i in 1..n
        b[k] =  @arr_rnd[i]
        if @arr_rnd[i]<0
          nk+=1
          k+=1
          b[k]=0
        end
        k+=1
      end
      n=nk
       @arr_rnd=b
    for i in 1..n
    p "#{i} : #{@arr_rnd[i]}"
  end
  p '------------------------------------------'
end

def task29
  p 'Дан целочисленный массив. Упорядочить его по возрастанию.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  p " #{@arr_rnd.sort}"
  p '------------------------------------------'
end

def task30
  p 'Дан целочисленный массив. Упорядочить его по убыванию.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  p " #{@arr_rnd.sort {|f,l| l <=> f}}"
  p '------------------------------------------'
end

def task31
  p 'Дан целочисленный массив. Вывести индексы массива в том порядке, в котором соответствующие им элементы образуют убывающую последовательность.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  p " index : #{(0...@arr_rnd.size).sort_by{ |i| @arr_rnd[i] }.reverse}"
  p " value : #{ @arr_rnd.sort {|f,l| l <=> f}}"
  p '------------------------------------------'
end


def task32
  p 'Дан целочисленный массив. Вывести индексы массива в том порядке, в котором соответствующие им элементы образуют возрастающую последовательность.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  p " index #{(0...@arr_rnd.size).sort_by{ |i| @arr_rnd[i] }}"
  p " value #{ @arr_rnd.sort {|f,l| f <=> l}}"
  p '------------------------------------------'
end

def task33
  p 'Дан целочисленный массив. Найти индекс минимального элемента.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  p @arr_rnd.each_with_index.min
  p 'Val Ind'
  p '------------------------------------------'
end

def task34
  p 'Дан целочисленный массив. Найти индекс максимального элемента.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  p @arr_rnd.each_with_index.max
  p 'Val Ind'
  p '------------------------------------------'
end

def task35
  p 'Дан целочисленный массив. Найти индекс первого минимального элемента.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  p "   #{@arr_rnd.index(@arr_rnd.min)}"
  p '------------------------------------------'
end

def task36
  p 'Дан целочисленный массив. Найти индекс первого максимального элемента.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  p "   #{@arr_rnd.index(@arr_rnd.max)}"
  p '------------------------------------------'
end

def task37
  p 'Дан целочисленный массив. Найти индекс последнего минимального элемента.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  p "    #{@arr_rnd.rindex(@arr_rnd.min)}"
  p '------------------------------------------'
end

def task38
  p 'Дан целочисленный массив. Найти индекс последнего максимального элемента.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  p "   #{@arr_rnd.rindex(@arr_rnd.max)}"
  p '------------------------------------------'
end

def task39
  p 'Дан целочисленный массив. Найти количество минимальных элементов.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  p " min elements indexes > #{@arr_rnd.each.with_index.find_all{ |a,i| a == @arr_rnd.min }.map{ |a,b| b }}"
  p " min elements  values > #{c = @arr_rnd.each.with_index.find_all{ |a,i| a == @arr_rnd.min }.map{ |a,b| a }}"
  p " min elements   count > #{c.count}"
  p '------------------------------------------'
end

def task40
  p 'Дан целочисленный массив. Найти количество максимальных элементов.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  p " max elements indexes > #{@arr_rnd.each.with_index.find_all{ |a,i| a == @arr_rnd.max }.map{ |a,b| b }}"
  p " max elements  values > #{c =@arr_rnd.each.with_index.find_all{ |a,i| a == @arr_rnd.max }.map{ |a,b| a }}"
  p " max elements   count > #{c.count}"
  p '------------------------------------------'
end

def task41
  p 'Дан целочисленный массив. Найти минимальный четный элемент.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  p "   #{@arr_rnd.select{|el| el%2==0}.min}"
  p '------------------------------------------'
end

def task42
  p 'Дан целочисленный массив. Найти минимальный нечетный элемент.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  p "   #{@arr_rnd.select{|el| el%2!=0}.min}"
  p '------------------------------------------'
end

def task43
  p 'Дан целочисленный массив. Найти максимальный четный элемент.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  p "   #{@arr_rnd.select{|el| el%2==0}.max}"
  p '------------------------------------------'
end

def task44
  p 'Дан целочисленный массив. Найти максимальный нечетный элемент.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  p "   #{@arr_rnd.select{|el| el%2!=0}.max}"
  p '------------------------------------------'
end

def task45
  p 'Дан целочисленный массив. Найти минимальный положительный элемент.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  p "   #{@arr_rnd.select{|el| el.positive?}.min}"
  p '------------------------------------------'
end

def task46
  p 'Дан целочисленный массив. Найти максимальный отрицательный элемент.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  p "   #{@arr_rnd.select{|el| el.negative?}.max}"
  p '------------------------------------------'
end

def task47
  p 'Дан целочисленный массив и интервал a..b. Найти минимальный из элементов в этом интервале.'
  p "Array > #{arr = [1,5,3,66,1,99,32,3,10,66,8,99,1]}"
  p 'interval 10..100'
  p ' Result '
  p "  #{arr.each.with_index.find_all{ |a,i| a>10 && a <100 }.map{ |a,b| a }.min}"
  p '------------------------------------------'
end

def task48
  p 'Дан целочисленный массив и интервал a..b. Найти максимальный из элементов в этом интервале.'
  p "Array > #{arr = [1,5,3,66,1,99,32,3,10,66,8,99,1]}"
  p 'interval 10..100'
  p ' Result '
  p "   #{arr.each.with_index.find_all{ |a,i| a>10 && a <100 }.map{ |a,b| a }.max}"
  p '------------------------------------------'
end

def task49
  p 'Дан целочисленный массив. Найти количество элементов, расположенных перед первым минимальным.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  min_b = @arr_rnd.each.with_index.find_all{ |a,i| a == @arr_rnd.min }.map{ |a,b| b }
  p "   #{min_b[0]}"
  p '------------------------------------------'
end

def task50
  p 'Дан целочисленный массив. Найти количество элементов, расположенных перед первым максимальным.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  max_b = @arr_rnd.each.with_index.find_all{ |a,i| a == @arr_rnd.max }.map{ |a,b| b }
  p "   #{max_b[0]}"
  p '------------------------------------------'
end

def task51
  p 'Дан целочисленный массив. Найти количество элементов, расположенных после первого максимального.'
  p " Array : #{@arr_rnd}"
  p ' Result '
  max_a = @arr_rnd[(@arr_rnd.index(@arr_rnd.max))...@arr_rnd.length - 1]
  p "   #{max_a.count}"  if @arr_rnd.index(@arr_rnd.min) != @arr_rnd.length - 1
  p '------------------------------------------'
end

def task52
  p 'Дан целочисленный массив. Найти количество элементов, расположенных после первого минимального .'
  p " Array : #{@arr_rnd}"
  p ' Result '
  max_a = @arr_rnd[(@arr_rnd.index(@arr_rnd.min))...@arr_rnd.length - 1]
  p "  #{max_a.count}"  if @arr_rnd.index(@arr_rnd.min) != @arr_rnd.length - 1
  p '------------------------------------------'
end

def task57
  p 'Дан целочисленный массив. Найти индекс первого экстремального (то есть минимального или максимального) элемента.'
  # p " Array : #{@arr_rnd}"
  # p ' Result '
  ind = []
  p "Array > #{arr = [5,3,66,32,1,3,10,66,8,99,1]}"
  min = arr[0]
  for i in 1..arr.size-1
    if min>=arr[i]
      min=arr[i]
      ind << i
      p ind
    end
  end
  # p "index first extr. min ele. #{ind.first}"
  p '------------------------------------------'
end


def task58
  p 'ан целочисленный массив. Найти индекс последнего экстремального (то есть минимального или максимального) элемента.'
  p "Array > #{arr = [5,1,3,66,32,2,3,10,66,8,99,1]}"
  ind = []
  min = arr[0]
  for i in 1..arr.size-1
    if min>=arr[i]
      min=arr[i]
      ind << i
    end
  end
  p "index first extr. min ele. #{ind.last}"
end


#end of class
end
less = HW1_My_Arr.new
less.task57
