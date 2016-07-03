class Product
	@@products = []
	
	def self.all
		@@products
	end
	
	def initialize(options={})
		@@products << self
	end
end