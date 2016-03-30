class Transaction
    attr_reader :id, :customer, :product
    
    @@count = 1 
    @@transactions = []
    
    def initialize(customer, product)
        @id = @@count
        @@count += 1 
        @customer = customer
        @product = product
        add_to_transactions 
    end
    
    def self.all
        @@transactions
    end
    
    private
    
    
        # method to add transactions - check if products are out of stock, then run reduce_stock
    def add_to_transactions
        if @product.stock == 0 
            puts" OutOfStockError, #{@product.title} is out of stock."
        else
            @product.reduce_stock 
            @@transactions << self 
        end
    end

    #method to find a transaction, based on the id
    def self.find(id)
        @@transactions.find {|p| p.id == id} 
    end

end
