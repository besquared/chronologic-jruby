module Chronologic
  module Estimations
    class Average
      attr_accessor :sample
      
      def initialize(sample)
        @sample = sample
      end
    end
  end
end