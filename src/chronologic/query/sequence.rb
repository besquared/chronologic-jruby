module Chronologic
  module Query
    class Sequence
      attr_accessor :events
      
      def initialize(events)
        @event = events
      end
            
      def length
        @events.length
      end
    end
  end
end