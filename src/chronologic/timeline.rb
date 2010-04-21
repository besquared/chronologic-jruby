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
    
    def sample(query, options = {}, &block)
      options = {:size => 1000}.merge(options)
      sample_ids = index.sample(query, options)
      events = storage.find_all(sample_ids).compact
    end
  end
end