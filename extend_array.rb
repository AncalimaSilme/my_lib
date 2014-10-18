# coding: utf-8

class Array

  # INSERT_ARRAY methods
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

end
