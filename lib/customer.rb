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

  def self.all
    @@customers
  end

  private

  def add_to_customers
    raise DuplicateCustomerError, name if @@customers.index { |c| c.name == name }
    @@customers << self
  end
end
