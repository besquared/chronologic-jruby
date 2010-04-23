module Chronologic
  module Query
    class Sequential
      attr_accessor :query
      attr_accessor :timeline
      attr_accessor :cluster_by
      
      def initialize(timeline, query = "", cluster_by = nil)
        @query = query
        @timeline = timeline
        @cluster_by = cluster_by
      end
    end
  end
end