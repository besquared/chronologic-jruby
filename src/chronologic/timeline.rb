module Chronologic
  class Timeline
    attr_accessor :indices
    attr_accessor :storage
    
    def initialize(name)
      @indices = {}
      @storage = Configuration.storage
    end
  end
end