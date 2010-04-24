module Chronologic
  module Query
    class Sampler
      attr_accessor :query
      
      def initialize(query)
        @query = query
      end
      
      def sample(options = {})
        timeline = Timeline.new(query.timeline)
        sample = timeline.sample(query.query, :size => options[:size] || 1000)
        
        Dataset.create(sample, ['group and cluster', 'events'])
        
        if query.cluster_by
          ClusteredSequence.new(query.cluster_by, sample)
        else
          Sequence.new(sample)
        end
      end
    end
  end
end