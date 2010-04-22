module Chronologic
  module Query
    class GroupedSequence
      attr_accessor :name
      attr_accessor :timelines
      
      def initialize(name, &block)
        @timelines = {}
      end
      
      def <<(events)
        @timeline += events
      end
    end
  end
end