# require the monkey patches
%w( array numeric object string symbol).each do |file|
  require "core_ext/#{file}"
end


require 'rubygems'
gem 'sexp'
require 'sexp'
require 'interpreter'

class Rlisp
  def interpreter
    Interpreter.new
  end
end