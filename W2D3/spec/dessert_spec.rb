require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do

  let(:chef) { double("chef", name: "john") }
  subject(:brownie) {Dessert.new(:brownie, 50, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq(:brownie)
    end
    it "sets a quantity" do
      expect(brownie.quantity).to eq(50)
    end
    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end
    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new(:cake, "lots", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) {brownie.add_ingredient(:eggs)}

    it "adds an ingredient to the ingredients array" do
      expect(brownie.ingredients).to eq([:eggs])
    end


  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(brownie.mix!).to eq(brownie.ingredients.shuffle)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(brownie.eat(10)).to eq(brownie.quantity)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {brownie.eat(200)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
