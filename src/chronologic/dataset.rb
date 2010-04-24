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
      def create(sample, columns, rows, group_by = [])
        # go through and group a bunch of things here
      end
    end
  end
end