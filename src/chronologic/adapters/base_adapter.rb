module Chronologic
  module Adapters
    class BaseAdapter      
      def find(table, id)
        raise NotImplementedError
      end
      
      def find_all(table, ids)
        raise NotImplementedError
      end
      
      def create(table, id, data = {})
        raise NotImplementedError
      end
      
      def destroy(table, id)
        raise NotImplementedError
      end
    end
  end
end