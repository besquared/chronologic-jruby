#
# Matches a substring pattern in the template form of (X, Y, Y, X, ...)
#

module Pattern
  module Patterns
    class Substring
      attr_accessor :template
      
      def initialize(template)
        @template = template
      end
      
      def left_match(sequence)
      end
      
      def all_matches(sequence)
      end
    end
  end
end