class Customer
	attr_reader :name

	@@customers = []
	
	def self.all
		@@customers
	end
	
	def initialize(options=[])
		@name = options[:name]
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
	
	def add_to_customers
		if !self.class.find_by_name name
			@@customers << self
		else
			raise DuplicateCustomerError, "'#{name}' already exists."
		end
	end
	
end