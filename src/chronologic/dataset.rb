# a bunch of data rows
module Chronologic
  class Dataset
    include Enumerable
    
    attr_accessor :rows
    attr_accessor :columns
    attr_accessor :sample
    
    def initialize(sample, columns = [], rows = [])
      @columns = columns
      @rows = rows
    end
    
    def each
      rows.each do |row|
        yield row
      end
    end
    
    def <<(row)
      rows << row
    end
    
    def [](idx)
      rows[idx]
    end
    
    class << self
      def create(sample, global_dimensions = nil)
        
        if global_dimensions.nil?
          create_flat(sample)
        else
          create_grouped(sample, global_dimensions)
        end
      end
      
      def create_flat(sample)
        
      end
      
      def create_grouped(sample, global_dimensions)
        groups = {}
        sample.each do |event|
          key_parts = []
          global_dimensions.each do |dimension|
            key_parts << event[dimension]
          end
          groups[key_parts] ||= []
          groups[key_parts] << event
        end
        
        groups.each do |group|
          
        end
      end
    end
  end
end