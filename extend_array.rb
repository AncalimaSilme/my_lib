# coding: utf-8

class Array
  def insert_array(position, array)
    index = 0
    new_array = self.clone

    array.each do |element|
      new_array.insert position, element
      position += 1
    end

    new_array
  end

  def insert_array!(position, array)
    index = 0

    array.each do |element|
      self.insert position, element
      position += 1
    end

    self
  end
end
