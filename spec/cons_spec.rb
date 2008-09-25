# $: << "../"
require "spec_helper"
# require File.join(File.dirname(__FILE__), "../spec_helper")

describe Cons do
  it "should be able to convert a conslist to an array" do
    cons = Cons.new(1, Cons.new(2, :nil))
    cons.arrayify.should == [1,2]
  end
  
  it "should know that it's a valid conslist" do
    cons = Cons.new(1, Cons.new(2, :nil))
    cons.conslist?.should eql(true)
  end
  
  it "should know that a conslist is valid only if it ends in nil" do
    cons = Cons.new(:+, :-)
    cons.conslist?.should eql(false)
  end
  
  it "should know how to render it's self to an s-expression" do 
    cons = Cons.new(:+, Cons.new(1, Cons.new(2, :nil)))
    cons.to_sexp.should eql("(+ 1 2)")
  end
  
  it "should know how to evaluate a conslist as lisp" do
    cons = Cons.new(:+, Cons.new(1, Cons.new(2, :nil)))
    env = Env.new(nil, DEFAULTS)
    forms = Env.new(nil, FORMS)
    
    cons.lispeval(env, forms).should eql(3)
  end
  
  # it "should behave?" do
  #   cons = "(define a 1)".parse_sexp.consify
  #   env = Env.new(nil, DEFAULTS)
  #   forms = Env.new(nil, FORMS)
  # 
  #   puts cons.lispeval(env, forms)
  # end
end