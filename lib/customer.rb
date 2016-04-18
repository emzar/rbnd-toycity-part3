class Customer
  attr_reader :name

  @@customers = []

  def initialize(options = {})
    @name = options[:name]
    add_to_customers
  rescue StandardError => error
    puts "#{error.class}: #{error}"
  end

  def self.find_by_name(name)
    index = @@customers.index { |customer| customer.name == name }
    @@customers[index] if index
  end

  def self.all
    @@customers
  end

  def purchase(product)
    Transaction.new(self, product)
  rescue StandardError => error
    puts "#{error.class}: #{error}"
  end

  private

  def add_to_customers
    raise DuplicateCustomerError, name if Customer.find_by_name(name)
    @@customers << self
  end
end
