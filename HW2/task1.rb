# frozen_string_literal: true

array = [621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 14, 126, 532, 387, 441, 471, 337, 446, 18, 36, 202, 
         574, 556, 458, 16, 139, 222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 336].freeze
p ' – узнать количество элементов в массиве; '
p array.size
p ' – перевернуть массив; '
p array.reverse
p ' – найти наибольшее число; '
p array.max
p ' – найти наименьшее число; '
p array.min
p ' – отсортировать от меньшего к большему; '
p array.sort
p ' – отсортировать от большего к меньшему; '
p array.sort.reverse
p ' – удалить все нечетные числа; '
arr1 = array.dup
p arr1.delete_if(&:odd?)
p ' – оставить только те числа, которые без остатка делятся на 3; '
arr2 = array.dup
p arr2.select { |val| (val % 3).zero? }
p ' – удалить из массива числа, которые повторяются (то есть, нужно вывести массив, в котором нет повторов); '
p array.uniq
p ' –  разделить каждый элемент на 10, в результате элементы не должны быть округлены до целого; '
arr3 = []
array.each { |val| arr3 << val.to_f / 10 }
p arr3
p ' – получить новый массив, который бы содержал в себе те буквы английского алфавита, порядковый номер которых есть в нашем массиве; '
arr_words = ('a'..'z').to_a
arr_res = []
numbers = []
(1..array.size).each { |i| (1..arr_words.size).each { |y| arr_res << arr_words[y] if array[i] == y && numbers << array[i]} }
p arr_res, numbers
p ' – поменять местами минимальный и максимальный элементы массива; '
arr4 = array.dup
p array
i = arr4.each_with_index.min[1]
j = arr4.each_with_index.max[1]
arr4[i], arr4[j] = arr4[j], arr4[i]
p arr4
p ' – найти элементы, которые находятся перед минимальным числом в массиве;'
p array[0...array.index(array.min)]
p ' – необходимо найти три наименьших элемента.'
arr5 = array.dup
arr_res = []
3.times { arr_res << arr5.delete(arr5.min)}
p arr_res
