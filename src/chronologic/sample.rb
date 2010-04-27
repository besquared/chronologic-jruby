module Chronologic
  class Sample
    include Enumerable
    
    attr_accessor :events
    attr_accessor :size
    attr_accessor :population_size
  
    def initialize(events, size, population_size)
      @events = events
      @size = size
      @population_size = population_size
    end
    
    def each
      events.each do |event|
        yield event
      end
    end
  end
end