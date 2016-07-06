class Customer
	attr_reader :name, :transactions, :returns

	@@customers = []
	
	def self.all
		@@customers
	end
	
	def initialize(options=[])
		@name = options[:name]
		@transactions = []
		@returns = []
		add_to_customers
	end
	
	def self.find_by_name(name_string)
		@@customers.each do |customer|
			if customer.name == name_string
				return customer
			end
		end
		return false
	end
	
	def purchase(product)
		@transactions << Transaction.new(self, product)
	end
	
	# Returns the total amount spent by the customer
	def total_spent
		@transactions.inject(0) {|sum, transaction| sum + transaction.paid}
	end
	
	def return_item(product)
		if (transaction = find_transaction product)
			@transactions.delete transaction
			@returns << transaction
			Transaction.all.delete transaction
			product.increase_stock
		else
			raise NoTransactionToReturnError, "There is no purchase of '#{product.title}' to return for customer #{@name}."
		end
	end
	
	private
	
	def add_to_customers
		if !self.class.find_by_name name
			@@customers << self
		else
			raise DuplicateCustomerError, "'#{name}' already exists."
		end
	end
	
	# Finds the most recent purchase of this product
	def find_transaction(product)
		@transactions.reverse.find {|transaction| transaction.product == product}
	end
	
end