require_relative 'wallet'

w = Wallet.new('glenn', 1000)
puts w.inspect
w.add_money(100)
puts w.inspect
w.spend_money(1200)
puts w.inspect
