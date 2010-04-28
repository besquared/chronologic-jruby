module Chronologic
  module Query
    class Sequential
      attr_accessor :query
      attr_accessor :timeline
      attr_accessor :cluster_by
      
      def initialize(timeline, options = {})
        @timeline = timeline
        
        @query = options[:query]
        @cluster_by = options[:cluster_by] || nil
        @sequence_group_by = options[:sequence_group_by] || nil
      end
      
      # we need to make room here to add on stuff to the
      #  query after it's constructed to make things sane
      # count
      # count_distinct(field)
      # average(field)
      # ...
      
      def global_dimensions
        [@cluster_by, @sequence_group_by].flatten.compact
      end
    end
  end
end