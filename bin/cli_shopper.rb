#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(File.dirname(__FILE__), '..', 'lib', 'cli_shopping')

WELCOME = <<DESC
cli shopper for all your lookup needs
DESC
EXPECTED_FORMAT = <<FORMAT
expected format:
number_of_items description at cost

ex: 
1 cup of soup at 2.50
FORMAT
FINISH = <<FINISH
An empty input will complete the input and print your receipt:
FINISH

puts WELCOME + EXPECTED_FORMAT + FINISH

cart = ShoppingCart.new

while
  a = gets.chomp
  break if '' == a
  l = LineItem.new(a)
  if l.valid?
    cart.add(l)
  else
    puts "Sorry, \"#{a}\" could not be parsed."
    puts EXPECTED_FORMAT
  end
end

if cart.empty?
  puts "There is nothing in your cart."
else
  puts "Thanks for shopping with us."
  checkout = Checkout.new(cart)
  puts checkout.receipt
end
