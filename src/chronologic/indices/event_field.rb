module Chronologic
  module Indices
    class EventField
      attr_accessor :name
      attr_accessor :value
      attr_accessor :stored
      attr_accessor :lucene
      
      def initialize(name, value, stored)
        @name = name
        @value = value
        @stored = stored
        @lucene = org.apache.lucene
      end
      
      def stored
        if @stored
          lucene.document.Field::Store::YES
        else
          lucene.document.Field::Store::NO
        end
      end
      
      # expand this for analyzed fields
      def analyzed
        lucene.document.Field::Index::NOT_ANALYZED
      end
    end
  end
end