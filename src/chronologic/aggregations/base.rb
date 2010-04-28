module Chronologic
  module Aggregations
    class Base
      attr_accessor :pattern
      
      def initialize(pattern)
        @pattern = pattern
      end
    end
  end
end