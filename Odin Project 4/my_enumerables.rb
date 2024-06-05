module Enumerable
  # Your code goes here
  def my_any?
      self.each do |element|
        return element if yield
      end
      return false
    end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
    def my_each
      self.each do |element|
        yield element
      end
    end

    def my_any?
      self.each do |element|
        if yield element
          return true 
        end
      end
      return false
    end

    def my_each_with_index
      i=0
      self.each do |element|
        yield element, i
        i+=1
      end
    end

    def my_select
      result = []
      self.each do |element|
        if yield element
          result << element
        end
      end
      result
    end

    def my_all?
      flag = 0
      self.each do |element|
        if yield element
          flag +=1
        end
      end
      if flag == self.size
        true
      else
        false
      end
    end

    def my_none?
      self.each do |element|
        if yield element
          return false
        end
      end
      return true
    end

    def my_count
      count = 0
      unless block_given?
        return self.size
      end
      self.each do |element|
        if yield element
          count += 1
        end
      end
      count
    end

    def my_map
      result = []
      self.each do |element|
        result.append( yield element)
      end
      result
    end
end
