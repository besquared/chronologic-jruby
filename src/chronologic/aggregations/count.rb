module Chronlogic
  module Aggregations
    class Count
      attr_accessor :options
      
      def initialize(pattern, options = {})
        super(pattern)
        @options = options
      end
            
      def map(events)
        count = 0
        events.each do |count|
          count += 1
        end
        count
      end
      
      def reduce(maps)
        sum = 0
        maps.each do |count|
          sum += count
        end
        sum
      end
    end
  end
end