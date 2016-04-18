class Transaction
  attr_reader :customer, :product, :id

  @@transactions = []

  def initialize(customer, product)
    @customer = customer
    @product = product
    @id = @@transactions.size + 1
    @@transactions << self
  end
end
