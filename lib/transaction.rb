class Transaction
	attr_reader :id, :customer, :product, :cost, :paid

	@@transactions = []
	@@id = 1
	
	def self.all
		@@transactions
	end
	
	def self.find(id)
		@@transactions.bsearch {|transaction| transaction.id == id}
	end
	
	def initialize(customer, product, paid = product.price)
		@id = @@id
		@@id += 1
		@customer = customer
		@product = product
		@paid = paid
		invoke_transaction
	end
	
	private
	
	def invoke_transaction
		if @product.stock > 0
			@product.decrease_stock
			@@transactions << self
		else
			raise OutOfStockError, "'#{@product.title}' is out of stock."
		end
	end
	
end