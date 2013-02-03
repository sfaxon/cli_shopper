class ShoppingCart
  include Enumerable
  
  # it's a queue! 
  def initialize
    @cart = []
  end
  
  def add(x)
    @cart << x
  end
  
  def count
    @cart.length
  end
  
  def empty!
    @cart.clear
  end
  
  def each
    @cart.each { |i| yield i }
  end
end
