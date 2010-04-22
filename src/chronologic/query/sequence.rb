module Chronologic
  module Query
    class Sequence
      attr_accessor :timeline
      
      def initialize
        @timeline = []
      end
      
      def <<(events)
        timeline << events
      end
    end
  end
end