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
      
      event.merge!(:id => id)
      if not event.has_key?(:occurred_at)
        event.merge!(:occurred_at => Time.now.utc.to_i)
      end
      
      index.insert(event)
      storage.create(id, event) if options[:store]
    end
    
    def sample(query, options = {}, &block)
      options = {:size => 1000}.merge(options)
      sample_ids = index.sample(query, options)
      events = storage.find_all(sample_ids).compact
    end
  end
end