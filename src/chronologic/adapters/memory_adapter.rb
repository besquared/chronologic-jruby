module Chronologic
  module Adapters
    class MemoryAdapter < BaseAdapter
      attr_accessor :store
      
      def initialize
        @store = {}
      end
      
      def find(table, id)
        ensure_table(table)
        @store[table][id]
      end
      
      def find_all(table, ids)
        ids.collect{|id| find(table, id)}
      end
      
      def create(table, id, data = {})
        ensure_table(table)
        @store[table][id] = data
      end
      
      def destroy(table, id)
        ensure_table(table)
        @store[table].delete(id)
      end
    
    protected
      def ensure_table(table)
        @store[table] ||= {}
      end
    end
  end
end