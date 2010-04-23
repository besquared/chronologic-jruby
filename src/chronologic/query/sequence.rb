module Chronologic
  module Query
    class Sequence
      attr_accessor :timeline
      
      def initialize
        @timeline = []
      end
      
      def <<(events)
        @timeline += events
      end
      
      def length
        @timeline.length
      end
    end
  end
end