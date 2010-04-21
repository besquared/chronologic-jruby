module Chronologic
  module Adapters
    class BaseAdapter      
      def find(id)
        raise NotImplementedError
      end
      
      def create(id, data = {})
        raise NotImplementedError
      end
      
      def destroy(id, data = {})
        raise NotImplementedError
      end
    end
  end
end