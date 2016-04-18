class DuplicateProductError < StandardError
  def initialize(title)
    super("'#{title}' already exists")
  end
end

class DuplicateCustomerError < StandardError
  def initialize(name)
    super("'#{name}' already exists")
  end
end

class DuplicateBrandError < StandardError
  def initialize(title)
    super("'#{title}' already exists")
  end
end

class OutOfStockError < StandardError
  def initialize(title)
    super("'#{title}' is out of stock")
  end
end
