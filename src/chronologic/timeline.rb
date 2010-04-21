module Chronologic
  class Timeline
    attr_accessor :index
    attr_accessor :storage
    
    def initialize(name)
      @index = Indices::EventIndex::new(name)
      @storage = Configuration.instance.storage
    end
    
    def append(id, event, options = {})
      options = {:store => true}.merge(options)
      
      index.insert(event.merge(:id => id))
      
      if options[:store]
        storage.create(id, event)
      end
    end
  end
end