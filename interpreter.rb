require 'cons'
require 'environment'

DEFAULTS = {
  :nil => :nil,
  :t => :t,
  :+ => lambda{|x,y| x + y },
  :- => lambda{|x,y| x - y },
  :* => lambda{|x,y| x * y },
  :/ => lambda{|x,y| x / y },
  :car => lambda{|x| x.car },
  :cdr => lambda{|x| x.cdr },
  :cons => lambda{|x,y| Cons.new(x,y) },
  :atom? => lambda{|x| x.kind_of?(Cons) ? :nil : :t},
  :eq? => lambda{|x,y| x.equal?(y) ? :t : :nil },
  :list => lambda{|*args| Cons.from_a(args) },
  :print => lambda{|*args| puts args; :nil },
  :quote => lambda {|env, forms, exp| exp },
  :define => lambda {|env, forms, sym, value|
                      puts "sym: #{sym}, value: #{value}"
                      env.define(sym, value.lispeval(env, forms))
                    },
  :set! => lambda {|env, forms, sym, value| env.set(sum, value.lispeval(env, forms))}
}
FORMS = {}

class Interpreter
  def initialize(defaults = DEFAULTS, forms = FORMS)
    @env = Env.new(nil, defaults)
    @forms = Env.new(nil, forms)
  end
  
  def eval(string)
    puts "eval string: #{string}"
    
    exps = "(#{string})".parse_sexp
    exps.map do |exp|
      exp.consify.lispeval(@env, @forms)
    end.last
  end
  
  def repl
    print "> "
    
    STDIN.each_line do |line|
      begin
        puts self.eval(line).to_sexp
      rescue StandardError => e
        puts "ERROR: #{e}"
      end
      print "> "
    end
  end
end