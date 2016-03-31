require_relative "/lib/errors"

class Product 
    attr_reader :title, :price, :stock, :brand
    
    @@products = []
    
    #initialize function - new product has a title,price,stock qty and is added if add_to_product finds no duplicate
    #also added new feature - brand
    def initialize(options={})
        @title = options[:title]
        @price = options[:price]
        @stock = options[:stock]
        @brand = options[:brand] #new feature
        add_to_products
    end
    
    def self.all
        @@products
    end
    
    #method to select products in stock
    def self.in_stock
        @@products.select {|p| p.in_stock?} 
    end
    

    
    #method to check if stock variable >0
    def in_stock?
        @stock > 0 
    end
    
    #method to reduce stock variable by 1 - used by transaction.rb
    def reduce_stock
        @stock -= 1
    end
    
    
    
    private 
    
    #method to run through products and find duplicate title
    def self.find_by_title(title)
        @@products.find {|p| p.title == title} 
    end
    
    #method to add to products variable unless product title is a duplicate
    def add_to_products
        product = self.class.find_by_title(@title)
        if product
            puts " DuplicateProductError, #{title}' already exists."
        else
            @@products << self 
        end
    end
    
end
