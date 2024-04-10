require_relative "user"

class Seller < User
  def initialize(name)
    super(name) # Userクラスのinitializeメソッド呼び出し
  end

end
