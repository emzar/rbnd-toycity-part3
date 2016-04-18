class Customer
  attr_reader :name

  @@customers = []

  def initialize(options = {})
    @name = options[:name]
    begin
      add_to_customers
    rescue StandardError => error
      puts "#{error.class}: #{error}"
    end
  end

  def self.find_by_name(name)
    index = @@customers.index { |customer| customer.name == name }
    @@customers[index] if index
  end

  def self.all
    @@customers
  end

  private

  def add_to_customers
    raise DuplicateCustomerError, name if Customer.find_by_name(name)
    @@customers << self
  end
end
