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
    
    def purchase(product)
        Transaction.new(self, product)
    end
    
    def self.list
        @@customers.sort_by(&:name)
    end
    
    private
    
    #method to run through the customers variable and check to see if the name exists
    def self.find_by_name(name)
        @@customers.find {|p| p.name == name} 
    end
    
    #method to add a customer, if the customer is not a duplicate
    def add_a_customer
        customer = self.class.find_by_name(@name)
        if customer 
            puts " DuplicateCustomerError, #{name} already exists."
        else 
            @@customers << self 
        end
    end
end