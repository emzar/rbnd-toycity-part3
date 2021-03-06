class Product
  attr_reader :title, :price, :stock, :brand

  @@products = []

  def initialize(options = {})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    @brand = options[:brand]
    add_to_products
  rescue StandardError => error
    puts "#{error.class}: #{error}"
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

  def self.find_by_brand(brand)
    @@products.select { |product| product.brand == brand }
  end

  def remove_one_from_stock!
    @stock -= 1
  end

  private

  def add_to_products
    raise DuplicateProductError, title if Product.find_by_title(title)
    @@products << self
  end
end
