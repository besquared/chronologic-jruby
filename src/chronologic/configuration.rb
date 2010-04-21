module Chronologic
  class Configuration
    attr_accessor :properties
    
    def initialize
      @properties = {}
    end
    
    def index_path
      properties[:index_path] || "./index"
    end
    
    def storage
      storage_prop = properties[:storage]
      adapter = (storage_prop and storage_prop[:adapter]) || 'memory'
      
      if adapter == 'memory'
        @storage ||= Adapters::MemoryAdapter.new
      end
      
      return @storage
    end
    
    def configure(properties)
      @properties = properties
    end
    
    class << self
      attr_accessor :configuration
      
      def instance
        @configuration ||= new
      end
      
      def storage
        instance.storage
      end
    end
  end
end