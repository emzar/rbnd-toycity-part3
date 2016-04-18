class Brand
  attr_reader :title

  @@brands = []

  def initialize(options = {})
    @title = options[:title]
    add_to_brands
  rescue StandardError => error
    puts "#{error.class}: #{error}"
  end

  def in_stock?
    @stock > 0
  end

  def self.find_by_title(title)
    index = @@brands.index { |brand| brand.title == title }
    @@brands[index] if index
  end

  def self.all
    @@brands
  end

  private

  def add_to_brands
    raise DuplicateBrandError, title if Brand.find_by_title(title)
    @@brands << self
  end
end
