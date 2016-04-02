

class Customer  
    attr_reader :name
    
    @@customers = [] 
    
    def initialize(options={})
        @name = options[:name]
        add_a_customer
    end
    
    def self.all
        @@customers
    end
    
    #method to purchase a product -customer name and product name needed. Calls on Transaction file
    def purchase(product)
        if product.stock == 0 
            raise OutOfStockError, " OutOfStockError, #{product.title} is out of stock."
        else 
        Transaction.new(self, product)
        end
    end
    
    #private methods below
    private
    
    #method to run through the customers variable and check to see if the name exists
    def self.find_by_name(name)
        @@customers.find {|p| p.name == name} 
    end
    
    #method to add a customer, if the customer is not a duplicate
    def add_a_customer
        if Customer.find_by_name(@name).nil?
          @@customers << self
         else 
          raise DuplicateCustomerError, "DuplicateCustomerError, '#{@name}' already exists."
        end        
    end

end