module Chronologic
  module Query
    class LeftJoin
      attr_accessor :timeline
      attr_accessor :left_attribute
      attr_accessor :right_attribute
      
      def initialize(timeline, left_attribute, right_attribute)
        @timeline = timeline
        @left_attribute = left_attribute
        @right_attribute = right_attribute
      end
    end
  end
end