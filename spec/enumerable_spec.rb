require "enumerable"

describe Enumerable do
  let(:enum) { Class.new { include Enumerable} }

  describe "my_each" do
    context "given an array & block" do
      it 'iterates through the array and applies the block to each' do
        array2 = []
        [2,4,5].my_each {|x| array2 << x+=1}
        expect(array2).to eql([3,5,6])
      end
    end
  end

  describe "my_select" do
    context "given an array & block" do
      it 'returns an array containing all elements for which the given block is not false' do
        expect([2,4,5].my_select {|x| x%2 != 0}).to eql([5])
      end
    end
  end

  describe "my_all?" do
    context "given an array & block" do
      it 'true if block is true for all elements, false if any are do not match block.' do
        expect([2,4,5].my_all? {|x| x > 0}).to eql(true)
        expect([2,4,5].my_all? {|x| x < 0}).to eql(false)
      end
    end
  end

  describe "my_any?" do
    context "given an array & block" do
      it 'true if block is true any element. false if false for all' do
        expect([2,4,5].my_any? {|x| x%2 != 0}).to eql(true)
        expect([2,4,5].my_any? {|x| x < 0}).to eql(false)
      end
    end
  end

  describe "my_none?" do
    context "given an array & block" do
      it 'true if no element matches block requirements' do
        expect([2,4,5].my_none? {|x| x%2 != 0}).to eql(false)
        expect([2,4,5].my_none? {|x| x < 0}).to eql(true)
      end
    end
  end

  describe "my_count" do
    context "given an array" do
      it 'returns the count of elements in the array' do
        expect([2,4,5].my_count).to eql(3)
      end
    end

    context "given array and argument" do
      it 'returns the count of elements that equal the argument' do
        expect([2,2,4,5].my_count(2)).to eql(2)
      end
    end

    context "given array and block" do
      it 'returns the count of elements for which the block returns true' do
        expect([2,4,5].my_count {|x| x%2 != 0}).to eql(1)
      end
    end
  end

  describe "my_map" do
    context "given array and block" do
      it "invokes the block for each element for array and creates a new array with the result" do
        expect([2,4,5].my_map {|x| x * 3}).to eql([6,12,15])
      end
    end
  end


  describe "my_inject" do
    context 'given an array & block' do
      it 'combines the contents based on the block given' do
        expect([2,4,5].my_inject {|product, x| product * x}).to eql(40)
      end
    end
  end
end
