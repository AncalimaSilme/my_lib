# coding: utf-8

class Array

  # INSERT_ARRAY and INSERT_ARRAY!
  ["insert_array", "insert_array!"].each do |method_name|
    define_method method_name do |position, additional_array|
      index = 0
      array = (method_name.include? "!") ? self : self.clone

      additional_array.each do |element|
        array.insert position, element
        position += 1
      end

      array
    end
  end

  # CONTAINS?
  def contains?(compare_variable)
    raise ArgumentError, "Argument may be just Array." if compare_variable.class.to_s != "Array"
    raise ArgumentError, "Argument may be just Array, but not empty." if compare_variable.class.to_s == "Array" && compare_variable.empty?

    working_array = self.compact.uniq
    result = compare_variable.map { |element| working_array.include? element  }.uniq

    result.size == 1 && result.first == true
  end

end
