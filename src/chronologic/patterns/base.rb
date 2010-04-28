module Chronologic
  module Pattern
    class Base
      def left_match(sequence)
        raise NotImplementedError
      end
      
      def all_matches(sequence)
        raise NotImplementedError
      end
    end
  end
end