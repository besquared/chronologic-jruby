module Chronologic
  class Configuration
    attr_accessor :properties
    
    def initialize
      @properties = {}
    end
    
    def index_path
      @properties[:index_path] || "./index"
    end
    
    def configure(properties)
      @properties = properties
    end
    
    class << self
      attr_accessor :configuration
      
      def instance
        @configuration ||= new
      end
    end
  end
end