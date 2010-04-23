module Chronologic
  module Query
    class ClusteredSequence
      attr_accessor :name
      attr_accessor :events
      
      def initialize(name, events)
        @name = name
        @events = {}
        
        events.each do |event|
          @events[event[name]] ||= []
          @events[event[name]] << event
        end
      end
            
      def length(cluster = nil)
        if cluster.nil?
          @events.length
        else
          @events[cluster].length
        end
      end
    end
  end
end