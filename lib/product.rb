class Product
  attr_reader :title

  @@products = []

  def initialize(options = {})
    @title = options[:title]
    add_to_products
  end

  def self.all
    @@products
  end

  private

  def add_to_products
    raise DuplicateProductError if @@products.find_index { |product| product.title == @title }
    @@products << self
  end
end
