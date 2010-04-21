module Chronologic
  module Adapters
    class MemoryAdapter < BaseAdapter
      attr_accessor :store
      
      def initialize
        @store = {}
      end
      
      def find(id)
        @store[id]
      end
      
      def find_all(ids)
        ids.collect{|id| find(id)}
      end
      
      def create(id, data = {})
        @store[id] = data
      end
      
      def destroy(id)
        @store.delete(id)
      end
    end
  end
end