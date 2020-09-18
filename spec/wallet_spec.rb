require 'wallet'

RSpec.describe Wallet do
  before(:context) do
    @wallet = Wallet.new('glenn', 100)
  end
  
  describe 'initialization' do
    it 'raises TypeError when input balance is not a number' do
      expect { Wallet.new('harvey', '1.0') }.to raise_error(TypeError)
    end
    
    it 'raises RangeError when input balance is negative' do
      expect { Wallet.new('harvey', -0.05) }.to raise_error(RangeError)
    end
  end

  describe 'transactions' do
    it 'adds money successfully' do
      expect(@wallet.add_money(100)).to equal(200.0)
    end

    it 'spends money successfully' do
      expect(@wallet.spend_money(200)).to equal(0.0)
    end

    it 'returns nil when trying to spend by overdrafting' do
      expect(@wallet.spend_money(1337)).to equal(nil)
    end

    it 'raises RangeError when adding or spending negative money' do
      expect { @wallet.add_money(-500) }.to raise_error(RangeError)
      expect { @wallet.spend_money(-0.5) }.to raise_error(RangeError)
    end
  end
end
