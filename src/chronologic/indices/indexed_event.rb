module Chronologic
  module Indices
    class IndexedEvent
      attr_accessor :event
    
      def initialize(event)
        @event = event
      end
    
      def [](key)
        event.get(key)
      end
    end
  end
end