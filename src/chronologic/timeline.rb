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
    
    def sample(query = "", options = {}, &block)
      options = {:size => 1000, :load => true}.merge(options)
      
      sample_ids = index.sample(query, options)
      
      if options[:load]
        storage.find_all(name, sample_ids).compact
      else
        sample_ids
      end
    end
  end
end