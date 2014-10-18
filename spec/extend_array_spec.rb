# coding: utf-8

require "rspec"
require_relative "../extend_array"

describe Array do

  context "#insert_array" do
    before :all do
      @original_array = [1, 2, 3, 7, 9, 10]
      @addition_array = [4, 5, 6]
      @position = 3
    end

    it "количество элементов должно быть равно сумме изначального массива и вкладываемого" do
      result_array = @original_array.insert_array @position, @addition_array
      expect(result_array.size).to eql(@original_array.size + @addition_array.size)
    end

    it "в выходном массиве должны быть все элементы из изначального массива" do
      result_array = @original_array.insert_array @position, @addition_array
      expect(result_array - @addition_array).to eql @original_array
   end

    it "в выходном массиве должны быть все элементы из вкладываемого массива" do
      result_array = @original_array.insert_array @position, @addition_array
      expect(result_array - @original_array).to eql @addition_array
    end
  end

  context "#insert_array!" do
    before :each do
      @original_array = [1, 2, 3, 7, 9, 10]
      @addition_array = [4, 5, 6]
      @position = 3
    end

    it "количество элементов оригинального массива должно увеличится на количество вкладываемого" do
      size_of_original_array_before_changes = @original_array.size

      @original_array.insert_array! @position, @addition_array
      expect(@original_array.size - @addition_array.size).to eql size_of_original_array_before_changes
    end

    it "оригинальный массив содержит все свои элементы" do
      original_array_before_changes = @original_array.clone

      @original_array.insert_array! @position, @addition_array
      expect(@original_array - @addition_array).to eql original_array_before_changes
    end

    it "оригинальный массив содержит все элементы вложенного массива" do
      original_array_before_changes = @original_array.clone

      @original_array.insert_array! @position, @addition_array
      expect(@original_array - original_array_before_changes).to eql @addition_array
    end
  end
end
