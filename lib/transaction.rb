class Transaction
	attr_reader :id, :customer, :product

	@@transactions = []
	@@id = 1
	
	def self.all
		@@transactions
	end
	
	def initialize(customer, product)
		@id = @@id
		@@id += 1
		@customer = customer
		@product = product
		invoke_transaction
	end
	
	def invoke_transaction
		if @product.stock > 0
			@product.decrease_stock
		end
	end
	
end