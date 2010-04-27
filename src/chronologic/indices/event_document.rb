module Chronologic
  module Indices
    class EventDocument
      include Enumerable
      
      attr_accessor :fields
      
      def initialize
        @fields = []
      end
      
      def add(name, value, stored)
        fields << EventField.new(name, value, stored)
      end
      
      def remove(name)
        fields.delete_if{|field| field.name == name}
      end
      
      def each
        fields.each do |field|
          yield field
        end
      end
      
      def has_field?(name)
        fields.detect{|field| field.name == name}
      end
    end
  end
end