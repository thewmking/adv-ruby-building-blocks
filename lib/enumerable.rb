module Enumerable
  def my_each
    i = 0
      while i < self.length
        yield self[i]
        i+=1
      end
  end

  def my_each_with_index
    for i in self
      yield(self.index(i));
      end
  end

  def my_select
    result_array = []
    for num in self
      if yield(num) == true
      result_array << num
      end
    end
    return result_array
  end

  def my_all?
    all = true
    self.my_each do |x|
      all = false unless yield x
    end
    return all
  end

  def my_any?
    any = false
    self.my_each do |x|
      any = true if yield x
    end
    return any
  end

  def my_none?
    none = true
    self.my_each do |x|
      none = false if yield x
    end
    return none
  end

  def my_count(number = nil)
    count = 0
    for i in self
      if block_given?
        count +=1 if yield(i) == true
      elsif number != nil
        count +=1 if i == number
      else
        count +=1
      end
    end
  return count
  end


  def my_map
    result_array = []
    self.my_each do |x|
      result_array << yield(x)
    end
    return result_array
  end

  def my_inject
    i = nil
    self.my_each do |x|
      if i == nil
        i = x
      else
        i = yield i, x
      end
    end
    return i
  end

  def my_map2(proc = nil)
    unless proc
      return self
    end
    result_array = []
    self.my_each do |x|
      result_array << proc.call(x)
    end
    return result_array
  end

  def my_map3(proc = nil)
    result_array = []
    if proc
    self.my_each do |x|
      result_array << proc.call(x)
    end
    else
      self.my_each do |x|
        result_array << yield(x)
      end
    end
    return result_array
  end



end

def multiply_els(array)
  array.my_inject {|product, x| product * x}
end





# #tests
#
# array = [1,3,5,10,11,234,677,2013]
#
# puts "ruby each:"
# array.each {|x| puts "Value is #{x}"}
# puts "my each:"
# array.my_each {|x| puts "Value is #{x}"}
#
# puts "ruby select:"
# puts "#{array.select {|x| x%2 != 0}}"
# puts "my select:"
# puts "#{array.my_select {|x| x%2 != 0}}"
#
# puts "ruby map:"
# puts "#{array.map {|x| x**2}}"
# puts "my map:"
# puts "#{array.my_map {|x| x**2}}"
#
# array2 = [2,4,5,6]
# puts "ruby all:"
# puts "#{array2.all? {|x| x > 0}} should be true"
# puts "#{array2.all? {|x| x.even?}} should be false"
# puts "my all:"
# puts "#{array2.my_all? {|x| x > 0}} should be true"
# puts "#{array2.my_all? {|x| x.even?}} should be false"
#
# puts "ruby any:"
# puts "#{array2.any? {|x| x.even?}} should be true"
# puts "#{array2.any? {|x| x < 0}} should be false"
# puts "my any:"
# puts "#{array2.my_any? {|x| x.even?}} should be true"
# puts "#{array2.my_any? {|x| x < 0}} should be false"
#
# puts "ruby none:"
# puts "#{array2.none? {|x| x.even?}} should be false"
# puts "#{array2.none? {|x| x < 0}} should be true"
# puts "my none:"
# puts "#{array2.my_none? {|x| x.even?}} should be false"
# puts "#{array2.my_none? {|x| x < 0}} should be true"
#
# puts "ruby count:"
# puts "#{array2.count} should equal 4"
# puts "#{array2.count(2)} should equal 1"
# puts "#{array2.count {|x| x%2 == 0}} should equal 3"
# puts "my count:"
# puts "#{array2.my_count} should equal 4"
# puts "#{array2.my_count(2)} should equal 1"
# puts "#{array2.my_count {|x| x%2 == 0}} should equal 3"
#
# puts "ruby inject:"
# puts "#{array2.inject {|sum, n| sum + n}}"
#
# puts "my inject:"
# puts "#{array2.my_inject {|sum, n| sum + n}}"
#
# puts "multiply_els"
# puts "#{multiply_els([2,4,5])} should equal 40"
#
#
# proc1 = Proc.new { |x| x * 3}
# puts "my map2:"
# puts "#{array.my_map2(proc1)}"
#
# puts "my map3:"
# puts "#{array.my_map3(proc1)}"
# puts "#{array.my_map3 {|x| x*2}}"
# puts "#{array.my_map3(proc1) {|x| x*2}}"
