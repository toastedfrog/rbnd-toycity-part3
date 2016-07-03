class Product
	attr_reader :title

	@@products = []
	
	def self.all
		@@products
	end
	
	def initialize(options={})
		@title = options[:title]
		add_to_products
	end
	
	def add_to_products
		@@products.each do |product|
			if product.title == title
				raise DuplicateProductError, "#{title} already exists."
			end
		end
		@@products << self
	end
end