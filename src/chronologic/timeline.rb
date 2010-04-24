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
    
    def append(id, event, options = {})
      options = {:store => true}.merge(options)
      
      event.merge!(:id => id)
      if not event.has_key?('occurred_at')
        event.merge!('occurred_at' => Time.now.utc.to_i)
      end
      
      index.insert(event)
      storage.create(name, id, event) if options[:store]
    end
    
    def sample(query = "", options = {})
      index.sample(query, options)
    end
  end
end