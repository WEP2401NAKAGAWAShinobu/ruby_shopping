require_relative "item_manager"
require_relative "wallet"

class User
  include ItemManager
#User クラスは ItemManager モジュールのメソッドを使用できるようになる。
  attr_accessor :name#name 属性に値を読み書きするためのメソッドが提供される。
  attr_reader :wallet#wallet 属性の値を読み取るためのメソッドが提供される。

  def initialize(name)
    @name = name
    @wallet = Wallet.new(self) # UserインスタンスまたはUserを継承したクラスのインスタンスは生成されると、自身をオーナーとするウォレットを持ちます。
  end#このコンストラクタは、nameを引数として受け取り、@name 属性にその値を設定する。また、@wallet 属性には、Wallet.new(self) を使用して新しい Wallet インスタンスを生成し、User インスタンス自体をそのオーナーとして渡す。これにより、User インスタンスは、自身をオーナーとするウォレットを持つことになります

end
