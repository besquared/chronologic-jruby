module Chronologic
  module Query
    class Sequential
      attr_accessor :query
      attr_accessor :timeline
      attr_accessor :cluster_by
      
      def initialize(timeline, options = {})
        @timeline = timeline
        
        @query = options[:query]
        @cluster_by = options[:cluster_by]
        @sequence_group_by = options[:sequence_group_by]
      end
    end
  end
end