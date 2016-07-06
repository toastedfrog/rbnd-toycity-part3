class Product
	attr_reader :title, :price, :stock

	@@products = []
	
	def self.all
		@@products
	end
	
	def initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		add_to_products
	end
	
	def in_stock?
		stock>0 ? true : false
	end
	
	# Returns product or false
	def self.find_by_title(title_string)
		@@products.each do |product|
			if product.title == title_string
				return product
			end
		end
		return false
	end
	
	# Returns an array of all in-stock items
	def self.in_stock
		in_stock = []
		@@products.each do |product|
			if product.in_stock?
				in_stock << product
			end
		end
		in_stock
	end
	
	# Called when a transaction is created on this product
	def decrease_stock
		@stock -= 1
	end
	
	def increase_stock
		@stock += 1
	end
	
	private
	
	def add_to_products
		if !self.class.find_by_title title
			@@products << self
		else	
			raise DuplicateProductError, "'#{title}' already exists."
		end
	end
	
end