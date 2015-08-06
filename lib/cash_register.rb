class CashRegister
  attr_accessor :total, :discount, :most_recent_item

  def initialize(discount = nil)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(title, price, quantity = nil)
    if quantity
      @total += (price * quantity)
      quantity.times { @items << title }
    else
      @total += price
      @items << title
    end
    @most_recent_item = [title, price, quantity]
  end

  def apply_discount
    if discount
      @total -= (@total * @discount / 100)
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    title = @most_recent_item.first
    price = @most_recent_item[1]
    quantity = @most_recent_item.last

    if quantity
      @total -= price * quantity
      quantity.times { @items.delete(title) }
    else
      @total -= price
      @items.delete(title)
    end
  end
end
