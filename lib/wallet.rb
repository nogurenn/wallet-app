class Wallet
  attr_reader :owner, :balance
  
  def initialize(owner, balance=0.0)
    raise TypeError.new('balance is not a Numeric type, got #{balance.class}') unless balance.is_a? Numeric
    raise RangeError.new('balance should be non-negative, got #{balance}.') if balance < 0.0

    @owner = owner
    @balance = balance.to_f
  end

  def add_money(amount)
    raise RangeError.new('no such thing as adding negative money') if amount < 0.0

    @balance += amount
  end

  def spend_money(amount)
    # returns nil if overdrafting
    # else new balance if transaction allowed
    
    raise RangeError.new('no such thing as spending negative money') if amount < 0.0

    if @balance < amount
      # STDERR.puts 'overdraft is not allowed'
      return
    end

    @balance -= amount
  end
end
