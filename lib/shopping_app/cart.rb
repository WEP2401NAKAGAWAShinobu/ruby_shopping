require_relative "item_manager"
require_relative "ownable"

class Cart
  include ItemManager
  include Ownable

  def initialize(owner)
    self.owner = owner
    @items = []
  end

  def items
    # Cartにとってのitemsは自身の@itemsとしたいため、ItemManagerのitemsメソッドをオーバーライドします。
    # CartインスタンスがItemインスタンスを持つときは、オーナー権限の移譲をさせることなく、自身の@itemsに格納(Cart#add)するだけだからです。
    @items
  end

  def add(item)#add メソッドは、引数として受け取った item を @items 配列に追加する役割
    @items << item
  end

  def total_amount
    @items.sum(&:price)
  end #total_amount メソッドは、@items 配列に含まれるすべてのアイテムの価格の合計を返す

  def check_out
    return if owner.wallet.balance < total_amount
    # カートのオーナーのウォレットからアイテムのオーナーのウォレットに金額を移動する
  @items.each do |item|
    item.owner.wallet.deposit(item.price) 
    self.owner.wallet.withdraw(item.price) 
    
    item.owner = self.owner
  end

  # カートの中身を空にする
  @items.clear
    # ## 要件
  #   - カートの中身（Cart#items）のすべてのアイテムの購入金額が、カートのオーナーのウォレットからアイテムのオーナーのウォレットに移されること。
  #   - カートの中身（Cart#items）のすべてのアイテムのオーナー権限が、カートのオーナーに移されること。
  #   - カートの中身（Cart#items）が空になること。

  # ## ヒント
  #   - カートのオーナーのウォレット ==> self.owner.wallet
  #   - アイテムのオーナーのウォレット ==> item.owner.wallet
  #   - お金が移されるということ ==> (？)のウォレットからその分を引き出して、(？)のウォレットにその分を入金するということ
  #   - アイテムのオーナー権限がカートのオーナーに移されること ==> オーナーの書き換え(item.owner = ?)
  end

end
