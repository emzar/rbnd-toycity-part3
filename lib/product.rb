class Product
  attr_reader :title, :price, :stock

  @@products = []

  def initialize(options = {})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    begin
      add_to_products
    rescue StandardError => error
      puts "#{error.class}: #{error}"
    end
  end

  def in_stock?
    @stock > 0
  end

  def self.find_by_title(title)
    index = @@products.index { |product| product.title == title }
    @@products[index] if index
  end

  def self.all
    @@products
  end

  def self.in_stock
    @@products.select(&:in_stock?)
  end

  private

  def add_to_products
    raise DuplicateProductError, title if Product.find_by_title(title)
    @@products << self
  end
end
