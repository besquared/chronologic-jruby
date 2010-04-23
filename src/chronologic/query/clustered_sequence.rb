module Chronologic
  module Query
    class ClusteredSequence
      attr_accessor :name
      attr_accessor :timelines
      
      def initialize(name)
        @name = name
        @timelines = {}
      end
      
      def <<(events)
        events.each do |event|
          @timelines[event[name]] ||= []
          @timelines[event[name]] << event
        end
      end
      
      def length(cluster = nil)
        if cluster.nil?
          @timelines.length
        else
          @timelines[cluster].length
        end
      end
    end
  end
end