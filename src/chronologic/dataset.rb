# a bunch of data rows
module Chronologic
  class Dataset
    include Enumerable
    
    attr_accessor :name
    attr_accessor :rows
    attr_accessor :columns
    attr_accessor :sample
    
    def initialize(name, sample, columns = [], rows = [])
      @name = name
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
    
    def length
      rows.length
    end
    
    class << self
      def create(name, sample, options = {})
        if options[:group_by].nil? or options[:group_by].empty?
          create_flat(name, sample)
        else
          create_grouped(name, sample, options[:group_by])
        end
      end
      
      def create_flat(name, sample)
        # how do we create a flat dataset
      end
      
      def create_grouped(name, sample, group_by)
        groups = {}
        sample.each do |event|
          key_parts = []
          group_by.each do |dimension|
            key_parts << event[dimension]
          end
          groups[key_parts] ||= []
          groups[key_parts] << event
        end
        
        puts group_by.inspect
        puts groups.inspect
        
        groups.each do |group|
        end
      end
    end
  end
end