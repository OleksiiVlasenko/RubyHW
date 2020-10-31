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
