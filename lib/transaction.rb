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
    @@transactions[id - 1]
  end

  def self.find_by_customer(customer)
    @@transactions.select { |transaction| transaction.customer == customer }
  end

  def self.find_by_product(product)
    @@transactions.select { |transaction| transaction.product == product }
  end

  def self.all
    @@transactions
  end
end
