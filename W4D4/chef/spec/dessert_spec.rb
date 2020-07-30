require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:brownie) { Dessert.new("brownie", 50, chef)}
  

  describe "#initialize" do
   
    it "sets a type" do
        expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do
        expect(brownie.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
        expect(brownie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
        expect {Dessert.new("brownie", :six, chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
        expect(brownie.ingredients).to_not include('flour')
        brownie.add_ingredient('flour')
        expect(brownie.ingredients).to include('flour')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(brownie.mix!).to_not eq(brownie)
    end 
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(brownie.eat(5)).to eq(45)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {brownie.eat(55)}.to raise_error(RuntimeError)
    end
  end
  let(:chef) {Chef.new("Rob")}
  subject(:brownie) { Dessert.new("brownie", 50, chef)}
  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(brownie.serve).to include(chef.titleize)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      chef.bake(brownie)
      expect(brownie.temp).to eq(400) 
    end
  end
end
