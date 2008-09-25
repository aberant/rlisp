require "spec_helper"

describe Env, "when parentless" do
  before(:each) do
    @form = Env.new(nil, {})
    @form.define(:test, lambda{"special_form"})
  end
  
  
  it "should be able to reterive a special form" do 
    @form.defined?(:test).should eql(true)
  end
  
  it "should be able to define a symbol to a value and then change that value" do
    @form.defined?(:a).should eql(false)
    
    @form.define(:a, 1)
    @form.lookup(:a).should eql(1)
    @form.defined?(:a).should eql(true)
    
    @form.set(:a, 2)
    @form.lookup(:a).should eql(2)
  end
end

# describe Env, "when it has a parent" do
#   it "should ask its parent about a symbol if it does not have it locally defined" do
#     child = Env.new(@form, {})
#     child.defined?(:test).should eql(true)
#   end
# end