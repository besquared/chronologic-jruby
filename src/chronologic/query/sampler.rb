module Chronologic
  module Query
    class Sampler
      attr_accessor :query
      
      def initialize(query)
        @query = query
      end
      
      def sample(options = {})
        if query.cluster_by
          results = ClusteredSequence.new(query.cluster_by)
        else
          results = Sequence.new
        end
        
        timeline = Timeline.new(query.timeline)
        sample = timeline.sample(query.query, :size => options[:size] || 1000)
        
        results << sample unless sample.empty?
        
        results
      end
    end
  end
end