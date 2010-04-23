module Chronologic
  module Indices
    class Sample
      attr_accessor :events
      attr_accessor :sample_size
      attr_accessor :population_size
    
      def initialize(events, sample_size, population_size)
        @events = events
        @sample_size = sample_size
        @population_size = population_size
      end
    end
  end
end