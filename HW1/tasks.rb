p 'Task - 1'
arr = (1..10).to_a
p 'even index'
arr.each_with_index do |val,index|
  p val if (index % 2) == 0
end
p 'odd index'
arr.each_with_index do |val,index|
  p val if (index % 2) != 0
end
#---------------------------------
p 'Task 2'
arr = [1,2,3,4,5,6,7,8,9,10]
even,odd = [],[]
arr.each_with_index do |val,index|
if (index % 2)!=0
  odd << val
  else even << val
  end
end
p 'Odd index'
  odd.each {|odd| p odd}
p 'Even index'
  even.each {|even| p even}
#---------------------------------
