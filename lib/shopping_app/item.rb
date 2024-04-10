require_relative "ownable"
class Item
  include Ownable
  attr_reader :number, :name, :price #3つの属性に対して、読み取り専用のアクセサメソッドを自動的に定義

  @@instances = [] #Itemクラスのクラス変数である@@instancesを空の配列で初期化。この配列には、生成されたすべてのItemインスタンスが格納。

  def initialize(number, name, price, owner=nil)
    @number = number
    @name = name
    @price = price
    self.owner = owner
    #Itemクラスのインスタンスを初期化するためのメソッド。number、name、price、ownerの4つの引数を受けとる。ownerは所有者を表わすが、デフォルト値はnilに設定.

    # Itemインスタンスの生成時、そのItemインスタンス(self)は、@@insntancesというクラス変数に格納されます。
    @@instances << self
  end

  def label
    { number: number, name: name, price: price }
  end

  def self.all
    #　@@instancesを返します ==> Item.allでこれまでに生成されたItemインスタンスを全て返すということです。
    @@instances
  end

end