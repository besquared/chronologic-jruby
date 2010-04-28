module Chronologic
  module Query
    class Template
      attr_accessor :aliases
      
      def initialize
        aliases = []
      end
      
      def <<(alias_)
        @aliases << alias_
      end
    end
  end
end