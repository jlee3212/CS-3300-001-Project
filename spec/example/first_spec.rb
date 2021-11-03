require "rails_helper"

#One describe statement is a way of grouping tests. These below tests all describe "hello spec."
RSpec.describe "hello spec" do
  #This is one test
  it "should equal 42" do #Test for "should equal 42".
    expect(6 * 7).to eq(42) #expect({some expression}).to eq({some value}) - Expect an expression to evaluate to something.
  end

  #This is another describe statement that groups tests related to the String class.
  describe String do
    let(:string) { String.new }
    it "should provide an empty string" do #Test for "should provide an empty string".
      expect(string).to eq("")
    end
  end
end