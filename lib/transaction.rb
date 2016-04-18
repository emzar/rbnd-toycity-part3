class Transaction
  attr_reader :customer, :product, :id

  @@transactions = []

  def initialize(customer, product)
    raise OutOfStockError, product.title unless product.in_stock?
    @customer = customer
    @product = product
    @product.remove_one_from_stock!
    @id = @@transactions.size + 1
    @@transactions << self
  end

  def self.find(id)
    @@transactions[id-1]
  end

  def self.all
    @@transactions
  end
end
