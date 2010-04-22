module Chronologic
  module Query
    class LeftJoin
      attr_accessor :timeline
      attr_accessor :left_attribute
      attr_accessor :right_attribute
      attr_accessor :query
      
      def initialize(timeline, left_attribute, right_attribute, query = "")
        @timeline = timeline
        @left_attribute = left_attribute
        @right_attribute = right_attribute
        @query = query
      end
    end
  end
end