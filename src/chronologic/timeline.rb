module Chronologic
  class Timeline
    attr_accessor :name
    attr_accessor :index
    attr_accessor :storage
    
    def initialize(name)
      @name = name
      @index = Indices::EventIndex::new(name)
      @storage = Configuration.instance.storage
    end
    
    def append(event, options = {})
      if not event.has_field?('occurred_at')
        event.add('occurred_at', Time.now.utc.to_i, true)
      end
      
      index.insert(event)
    end
    
    def sample(options = {})
      index.sample(options)
    end
  end
end