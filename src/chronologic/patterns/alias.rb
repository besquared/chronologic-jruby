module Chronologic
  module Query
    class Alias
      attr_accessor :symbol
      attr_accessor :alias
      
      def initialize(symbol, alias_)
        @symbol = symbol
        @alias = alias_
      end
    end
  end
end