# coding: utf-8

require "rspec"
require_relative "../extend_array"

describe Array do

  describe "#insert_array"  do

    before :all do
      @original_array = [1, 2, 3, 7, 9, 10]
      @addition_array = [4, 5, 6]
      @position = 3
    end

    context do
      before :all do
        @result_array = @original_array.insert_array @position, @addition_array
      end

      it "количество элементов должно быть равно сумме изначального массива и вкладываемого" do
        expect(@result_array.size).to eql(@original_array.size + @addition_array.size)
      end

      it "в выходном массиве должны быть все элементы из изначального массива" do
        expect(@result_array - @addition_array).to eql @original_array
     end

      it "в выходном массиве должны быть все элементы из вкладываемого массива" do
        expect(@result_array - @original_array).to eql @addition_array
      end
    end

    context "!" do
      before :all do
        @original_array_before_changes = @original_array.clone
        @original_array.insert_array! @position, @addition_array
      end

      it "количество элементов оригинального массива должно увеличится на количество вкладываемого" do
        expect(@original_array.size - @addition_array.size).to eql @original_array_before_changes.size
      end

      it "оригинальный массив содержит все свои элементы" do
        expect(@original_array - @addition_array).to eql @original_array_before_changes
      end

      it "оригинальный массив содержит все элементы вложенного массива" do
        expect(@original_array - @original_array_before_changes).to eql @addition_array
      end
    end
  end



  context "#contains?" do
    before :all do
      @original_array = [1, 2, "", "test string", 87, {}, "f", 2, 15, 3, 5.3]
    end

    it "возвращает ошибку, если параметром передан не массив" do
      expect { @original_array.contains? 87 }.to raise_error(ArgumentError, "Argument may be just Array.")
    end

    it "возвращает ошибку, если параметром передан пустой массив" do
      expect { @original_array.contains? [] }.to raise_error(ArgumentError, "Argument may be just Array, but not empty.")
    end

    it "true" do
      expect(@original_array.contains? [87, 2, "f", 5.3]).to be_truthy
    end

    it "false" do
      expect(@original_array.contains? [8, 2, "h", 5.3]).to be_falsey
    end
  end

end
