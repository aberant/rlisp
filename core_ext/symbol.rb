class Symbol
  def lispeval(env, forms)
    env.lookup(self)
  end
  
  def arrayify
    self == :nil ? [] : self
  end
  
  def conslist?
    self == :nil
  end
end