module Chronologic
  module Query
    class Sampler
      attr_accessor :query
      
      def initialize(query)
        @query = query
      end
      
      def sample(options = {})
        timeline = Timeline.new(query.timeline)
        sample = timeline.sample(:query => query.query, :size => options[:size] || 1000)
        Dataset.create('events', sample, :group_by => query.global_dimensions)        
      end
    end
  end
end