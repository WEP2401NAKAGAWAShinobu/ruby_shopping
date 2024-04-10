require_relative "ownable"

class Wallet
  include Ownable
  attr_reader :balance#他のオブジェクトは Wallet インスタンスの残高を読み取ることができるが、直接変更することはできない。

  def initialize(owner)
    self.owner = owner
    @balance = 0
  end #引数としてownerを受け取り、そのownerを設定する。また、初期残高として 0 を設定。

  def deposit(amount)
    @balance += amount.to_i
  end #指定された金額をウォレットに入金するメソッド。引数 amount に指定された金額を残高に加算する。

  def withdraw(amount)
    return unless @balance >= amount
    @balance -= amount.to_i
    amount #指定された金額をウォレットから引き出すメソッド。引数 amount に指定された金額を残高から減算するが、引き出し金額が残高を超える場合は何も行わない。
  end

end