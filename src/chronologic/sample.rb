module Chronologic
  class Sample
    attr_accessor :events
    attr_accessor :population_size
    
    def initialize(events, population_size)
      @events = events
      @population_size = population_size
    end
  end
end